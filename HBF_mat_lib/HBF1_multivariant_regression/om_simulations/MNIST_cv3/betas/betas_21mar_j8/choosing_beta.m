%% get a better STD
clear;
beta_config_name = 'beta_config'; %<--- config file
run(sprintf('./%s.m', beta_config_name) )
beta_config_loc = sprintf('./%s/%s/%s.m', parent_beta_dir, beta_simulation_dir_name, beta_config_name)
run( beta_config_loc );
run('load_paths.m');
%% load data set
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
[D_out, ~] = size(y_train);
%%
betas = linspace(beta_start, beta_end, num_betas);
rbf_train_errors = zeros(1, num_betas);
rbf_test_errors = zeros(1, num_betas);
rbf_cell_list = cell([1, num_betas]);
tic;
for i=1:num_betas
    current_beta = betas(i);
    %% init
    K = center;
    if c_init_normalized
        c_init = (1 + 1)*rand(K,D_out) - 1;
    else
        c_init = rand(K,D_out); % (N x D)
    end
    t_init = datasample(X_train', K, 'Replace', false)'; % (D x N)
    if gpu_on
        c_init = gpuArray(c_init);
        t_init = gpuArray(t_init);
    end
    %% train RBF
    rbf = learn_RBF_linear_algebra( X_train, y_train, RBF(c_init,t_init,current_beta,0));
    test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf, 0 );
    train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf, 0 );
    if gpu_on
        rbf = rbf.gather(); 
    end
%     rbf_train_errors(i) = test_error_RBF;
%     rbf_cv_errors(i) = train_error_RBF;
    rbf_train_errors(i) = train_error_RBF;
    rbf_test_errors(i) = test_error_RBF;
    rbf_cell_list{i} = rbf;
end
time_passed = toc;
%% write time elapsed to file
[secs, minutes, hours, ~] = time_elapsed(num_betas, time_passed )
%% get best beta
[min_cv_error, index] = min(rbf_test_errors)
smallest_test_error_beta = betas(index)
smallest_test_error_beta_rbf = rbf_cell_list{index}
if visualize
    plot(betas, rbf_cv_errors)
end
%% git hash
[s,git_hash_string] = system('git rev-parse HEAD')
%% save relevant workspace
beta_workspace_name = sprintf(betas_files_names, beta_start, beta_end, num_betas, center)
results_path = sprintf('./%s/%s',parent_beta_dir, beta_simulation_dir_name)
loc = sprintf('%s/%s',  results_path, beta_workspace_name)
save(loc,'-regexp','^(?!(data4cv|X_[\w|\d]*|y_[\w|\d]*|rbf_cell_list)$).') % save everything except the exceptions
%% save my own code
my_self = 'choosing_beta.m';
source = sprintf('./%s', my_self);
destination = sprintf('%s/', results_path)
copyfile(source, destination);
%% DONE
beep;
disp('DONE');