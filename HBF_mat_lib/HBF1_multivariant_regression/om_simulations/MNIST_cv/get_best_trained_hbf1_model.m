function [] = get_best_trained_hbf1_model(slurm_job_id, task_id)
% gets the best HBF1 model with k centers from the number of initilizations
%% Load paths
restoredefaultpath
slurm_job_id
task_id
run('load_paths.m');
%path;
help HBF1
%% load configs
run('./simulation_config.m');
current_simulation_config = sprintf( './changing_params/%s%s', cp_folder, 'simulation_config.m' );
run(current_simulation_config);
changing_params_for_current_task = sprintf( sprintf('./changing_params/%s%s',cp_folder,cp_param_files_names), task_id );
run(changing_params_for_current_task);
%%
load(data_set_path); % data4cv
data4cv.normalize_data();
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
%% preparing models to train/test for mdl_iterator
D_out = D;
center
%% Run Hold Out Cross Validation
tic;
% param4mdl_func = @HBF1_parameters;
% params4mdl_iter = HBF1_iterator4training(center, gau_precision, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda);
% params4mdl_iter.create_inits_1layer(X_train,center,D_out);
% params4mdl_iter.create_initiliazations(X_train,D_out);
%% best_iteration_mdl = train_model_class_iterations_smallest_cv_error(X_train,y_train,X_cv,y_cv, params4mdl_iter);
%%
% visualize = 1
% K = center;
% c = normc(rand(K,D_out)); % (N x D)
% t = datasample(X_train', K, 'Replace', false)'; % (D x N)
% mdl_params = HBF1_parameters(c,t,gau_precision,lambda);
% best_iteration_mdl_params = learn_HBF1_SGD( X_train, y_train, mdl_params, iterations,visualize, X_test,y_test);
% best_iteration_mdl = HBF1(best_iteration_mdl_params)
%%
%visualize = 1
error_best_mdl_on_cv = inf;
%best_train = zeros(iterations,1);
%best_test = zeros(iterations,1);
best_iteration_mdl_params = -1;
for initialization_index=1:num_inits
    K = center;
    c_init = normc(rand(K,D_out)); % (N x D)
    t_init = datasample(X_train', K, 'Replace', false)'; % (D x N)
    mdl_params = HBF1_parameters(c_init,t_init,gau_precision,lambda);
    [ mdl_params, errors_train, errors_test ] = learn_HBF1_SGD( X_train, y_train, mdl_params, iterations,visualize, X_test,y_test, eta_c,eta_t);
    mdl_current = HBF1( mdl_params );
    error_mdl_new_on_cv = compute_Hf_sq_error(X_cv,y_cv, mdl_current, mdl_current.lambda );
    if error_mdl_new_on_cv < error_best_mdl_on_cv
        best_iteration_mdl_params = mdl_current;
        error_best_mdl_on_cv = error_mdl_new_on_cv;
        best_train = errors_train;
        best_test = errors_test;
        c_best = c_init;
        t_best = t_init;
    end   
end
best_iteration_mdl = HBF1(best_iteration_mdl_params);
train_error_HBF1 = compute_Hf_sq_error(X_train,y_train, best_iteration_mdl, best_iteration_mdl.lambda )
test_error_HBF1 = compute_Hf_sq_error(X_test,y_test, best_iteration_mdl, best_iteration_mdl.lambda )
%% write errors during iterations
vname=@(x) inputname(1);
error_iterations_file_name = sprintf('test_error_vs_iterations%d',task_id);
path_error_iterations = sprintf('%s%s',results_path,error_iterations_file_name)
save(path_error_iterations, vname(best_train),vname(best_test), vname(center), vname(iterations), vname(eta_c), vname(eta_t) );
%% RBF
rbf_params = RBF_parameters(c_best,t_best,gau_precision,best_iteration_mdl.lambda);
rbf_mdl_params = learn_RBF_linear_algebra( X_train, y_train, rbf_params);
rbf_mdl = RBF(rbf_mdl_params);
test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_mdl, rbf_mdl.lambda )
train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_mdl, rbf_mdl.lambda )
%% write results to file
result_file_name = sprintf('results_om_id%d.m',task_id);
results_path
result_path_file = sprintf('%s%s',results_path,result_file_name)
[fileID,~] = fopen(result_path_file, 'w')
fprintf(fileID, 'task_id=%d;\ncenter=%d;\ntest_error_HBF1=%d;\ntrain_error_HBF1=%d;\ntest_error_RBF=%d;\ntrain_error_RBF=%d;', task_id,center,test_error_HBF1,train_error_HBF1,test_error_RBF,train_error_RBF);
time_passed = toc;
%
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed )
time_file_name = sprintf('time_duration_om_id%d.m',task_id);
path_file = sprintf('%s%s',results_path,time_file_name);
fileID = fopen(path_file, 'w')
fprintf(fileID, 'task_id=%d;\nsecs=%d;\nminutes=%d;\nhours=%d;\niterations=%d;\ncenter=%d;\ndata_set=%s;', task_id,secs,minutes,hours,iterations,center,data_set_path);
end
