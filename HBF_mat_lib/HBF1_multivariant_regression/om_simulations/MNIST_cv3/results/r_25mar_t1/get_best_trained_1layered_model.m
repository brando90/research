function [] = get_best_trained_1layered_model(slurm_job_id, task_id)
restoredefaultpath
slurm_job_id
task_id
run('./simulation_config.m');
run('load_paths.m');
%% load configs
current_simulation_config = sprintf( './changing_params/%s%s', cp_folder, 'simulation_config.m' )
run(current_simulation_config);
changing_params_for_current_task = sprintf( sprintf('./changing_params/%s%s',cp_folder,cp_param_files_names), task_id )
run(changing_params_for_current_task);
%% load data set
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
%% preparing models to train/test for mdl_iterator
center
%% rand seed
rand_seed = get_rand_seed( slurm_job_id, task_id)
rng(rand_seed); %rand_gen.Seed
%% Run Hold Out Cross Validation
tic;
[D, N] = size(X_train);
[D_out, ~] = size(y_test);
if strcmp( train_func_name, 'learn_HSig_SGD') || strcmp( train_func_name, 'learn_ReLu_SGD')
    [~, N_train] = size(X_train);
    [~, N_cv] = size(X_cv);
    [~, N_test] = size(X_test);
    X_train = [X_train; ones(1,N_train)];
    X_cv = [X_cv; ones(1,N_cv)];
    X_test = [X_test; ones(1,N_test)];
    D = D+1;
end
if gpu_on
    X_train = gpuArray(X_train);
    y_train = gpuArray(y_train);
    X_cv = gpuArray(X_cv);
    y_cv = gpuArray(y_cv);
    X_test = gpuArray(X_test);
    y_test = gpuArray(y_test);
end
K = center;
if rbf_as_initilization
    disp('RBF!!!')
    %% RBF with linear algebra (LA)
    K = center;
    c_init = (1 + 1)*rand(K,D_out) - 1;
    t_init = datasample(X_train', K, 'Replace', false)'; % (D x N)
    if c_init_normalized
        c_init = normc(c_init);
    end
    if gpu_on
        c_init = gpuArray(c_init);
        t_init = gpuArray(t_init);
    end
    kernel_mdl = RBF(c_init,t_init,gau_precision,lambda);
    kernel_mdl = learn_RBF_linear_algebra( X_train, y_train, kernel_mdl);
    %% train HBF1
    c_init = kernel_mdl.c;
    t_init = kernel_mdl.t;
    mdl = HBF1(c_init,t_init,gau_precision,lambda);
    [ best_iteration_mdl, best_train, best_test ] = learn_HBF1_SGD( X_train, y_train, mdl, iterations,visualize, X_test,y_test, eta_c,eta_t, sgd_errors);
else
    error_best_mdl_on_cv = inf;
    best_iteration_mdl = -1;
    %y_std = std(y_train, 0, 2); % (1 x D) unbiased std of coordinate/var/feature
    %y_mean = mean(y_train, 2); % (1 x D) mean of coordinate/var/feature
    y_std = std(y_train,0,2); % (D_out x 1) unbiased std of coordinate/var/feature
    y_mean = mean(y_train,2); % (D_out x 1) mean of coordinate/var/feature
    y_std = repmat( y_std', [K,1]); % (K x D_out) for c = (K x D_out)
    y_mean = repmat( y_mean', [K,1]); % (K x D_out) for c = (K x D_out)  
    %min_y = min(y_train)
    %max_y = max(y_train)
    for initialization_index=1:num_inits
        fprintf('initialization_index = %d\n\n', initialization_index);
        %c_init = (1 + 1)*rand(K,D_out) - 1;
        %c_init = y_mean .* rand(K,D_out) + (2*rand(K,D_out)-1) y_std;
        %c_init = (y_std + y_std) .* rand(K,D_out) + y_mean;
        c_init = normrnd(y_mean,y_std,[K,D_out]);
        t_init = datasample(X_train', K, 'Replace', false)'; % (D x K)
        if c_init_normalized
            c_init = normc(c_init);
        end
        if gpu_on
            c_init = gpuArray(c_init);
            t_init = gpuArray(t_init);
        end
        if strcmp( train_func_name, 'learn_HBF1_SGD')
            mdl = HBF1(c_init,t_init,gau_precision,lambda);
            [ mdl, errors_train, errors_test ] = learn_HBF1_SGD( X_train, y_train, mdl, iterations,visualize, X_test,y_test, eta_c,eta_t, sgd_errors);
            %%
            kernel_mdl = RBF(c_best,t_best,gau_precision, best_iteration_mdl.lambda);
            kernel_mdl = learn_RBF_linear_algebra( X_train, y_train, kernel_mdl);
        elseif strcmp( train_func_name, 'learn_RBF_SGD')
            mdl = RBF(c_init,t_init,gau_precision,lambda);
            [ mdl, errors_train, errors_test ] = learn_RBF_SGD( X_train, y_train, mdl, iterations,visualize, X_test,y_test, eta_c, sgd_errors);
        elseif strcmp( train_func_name, 'learn_HSig_SGD')
            %t_init(D+1,:) = -1 * rand(1,D); %the offset is a threshold to activation function, so put it in that range, -1 because <x,w> - b > 0 <=> <x,w> > b
            eps = 0.1;
            t_mean  = norm(mean(t_init(1:D-1,:) ,2),2)^2;
            t_std = norm(std(t_init(1:D-1,:),0,2),2)^2;
            t_init(D,:) =  - normrnd(eps*t_mean - eps*t_std, t_std); % (1 x K)
            %
            mdl = HSig(c_init,t_init,lambda);
            [ mdl, errors_train, errors_test ] = learn_HSig_SGD( X_train, y_train, mdl, iterations,visualize, X_test,y_test, eta_c, eta_t, sgd_errors);
            %%
            kernel_mdl = HSig(c_init,t_init,lambda);
            Kern_matrix = sigmf(X_train' * kernel_mdl.t, [-1, 0]); % (N x K)
            C = Kern_matrix \ y_train';  % (K x D) = (N x K)' x (N x D)
            kernel_mdl.c = C; % (K x D)
        else
            error('The train function you gave: %s does not exist', train_func_name);
        end
        error_mdl_new_on_cv = compute_Hf_sq_error(X_cv,y_cv, mdl, mdl.lambda );
        if error_mdl_new_on_cv < error_best_mdl_on_cv
            best_iteration_mdl = mdl;
            error_best_mdl_on_cv = error_mdl_new_on_cv;
            best_train = errors_train;
            best_test = errors_test;
            c_best = c_init;
            t_best = t_init;
        end
    end
    %% Kernel with linear algebra (LA)
    %TODO
end
%% Errors of models
test_error_RBF = compute_Hf_sq_error(X_test,y_test, kernel_mdl, kernel_mdl.lambda )
train_error_RBF = compute_Hf_sq_error(X_train,y_train, kernel_mdl, kernel_mdl.lambda )
train_error_HBF1 = compute_Hf_sq_error(X_train,y_train, best_iteration_mdl, best_iteration_mdl.lambda )
test_error_HBF1 = compute_Hf_sq_error(X_test,y_test, best_iteration_mdl, best_iteration_mdl.lambda )
best_iteration_mdl = best_iteration_mdl.gather();
kernel_mdl = kernel_mdl.gather();
%% save everything/write errors during iterations
[s,git_hash_string] = system('git rev-parse HEAD')
vname=@(x) inputname(1);
error_iterations_file_name = sprintf('test_error_vs_iterations%d',task_id);
path_error_iterations = sprintf('%s%s',results_path,error_iterations_file_name)
save(path_error_iterations, vname(best_train),vname(best_test), vname(center), vname(iterations), vname(eta_c), vname(eta_t), vname(best_iteration_mdl), vname(kernel_mdl), vname(rand_seed), vname(git_hash_string) );
%% write results to file
result_file_name = sprintf('results_om_id%d.m',task_id);
results_path
result_path_file = sprintf('%s%s',results_path,result_file_name)
[fileID,~] = fopen(result_path_file, 'w')
fprintf(fileID, 'task_id=%d;\ncenter=%d;\ntest_error_HBF1=%d;\ntrain_error_HBF1=%d;\ntest_error_RBF=%d;\ntrain_error_RBF=%d;\n', task_id,center,test_error_HBF1,train_error_HBF1,test_error_RBF,train_error_RBF);
time_passed = toc;
%% save my own code
my_self = 'get_best_trained_1layered_model.m';
source = sprintf('./%s', my_self);
destination = sprintf('%s', results_path)
copyfile(source, destination);
%% write time elapsed to file
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed )
time_file_name = sprintf('time_duration_om_id%d.m',task_id);
path_file = sprintf('%s%s',results_path,time_file_name);
fileID = fopen(path_file, 'w')
fprintf(fileID, 'task_id=%d;\nsecs=%d;\nminutes=%d;\nhours=%d;\niterations=%d;\ncenter=%d;\ndata_set= ''%s'' ;', task_id,secs,minutes,hours,iterations,center,data_set_path);
disp('DONE');
disp('DONE training model')
end