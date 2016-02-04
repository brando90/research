function [] = get_best_trained_hbf1_model(task_id, changing_params_config, fixed_params_config, results_path)
% gets the best HBF1 model with k centers from the number of initilizations
%% Load paths
restoredefaultpath
disp(task_id);
disp(changing_params_config);
disp(fixed_params_config);
disp(results_path);
%path
run('load_paths');
%path;
%% load configs
run(changing_params_config);
fixed_params_config
run(fixed_params_config);
%%
data_set_path = '../../../common/data/data_MNIST_data4CV_1000.mat';
load(data_set_path); % data4cv
data4cv.normalize_data();
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
%% preparing models to train/test for mdl_iterator
param4mdl_func = @HBF1_parameters;
D_out = D;
center
params4mdl_iter = HBF1_iterator4training(center, gau_precision, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda);
params4mdl_iter.create_inits_1layer(X_train,center,D_out);
%% Run Hold Out Cross Validation
tic;
best_mdl_train = train_model_class_iterations_smallest_cv_error(X_train,y_train,X_cv,y_cv, params4mdl_iter);
test_error_HBF1 = compute_Hf_sq_error(X_test,y_test, best_mdl_train, best_mdl_train.lambda );
train_error_HBF1 = compute_Hf_sq_error(X_train,y_train, best_mdl_train, best_mdl_train.lambda );
%% RBF
rbf_mdl_params = learn_RBF_linear_algebra( X_train, y_train, best_mdl_train )
test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_mdl_params, rbf_mdl_params.lambda );
train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_mdl_params, rbf_mdl_params.lambda );
%% write results to file
result_file_name = sprintf('results_om_id%d.m',task_id);
path_file = sprintf('%s%s',results_path,result_file_name);
fileID = fopen(path_file, 'w')
%fprintf(fileID, 'center=%d;\ntest_error=%d;\ntrain_error=%d;', center,test_error_HBF1,train_error_HBF1);
fprintf(fileID, 'task_id=%d;\ncenter=%d;\ntest_error_HBF1=%d;\ntrain_error_HBF1=%d;\ntest_error_RBF=%d;\ntrain_error_RBF=%d;', task_id,center,test_error_HBF1,train_error_HBF1,test_error_RBF,train_error_RBF);
time_passed = toc;
%
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed )
time_file_name = sprintf('time_duration_om_id%d.m',task_id);
path_file = sprintf('%s%s',results_path,time_file_name);
fileID = fopen(path_file, 'w')
fprintf(fileID, 'task_id=%d;\nsecs=%d;\nminutes=%d;\nhours=%d;\niterations=%d;\ncenter=%d;', task_id,secs,minutes,hours,iterations,center);
end
