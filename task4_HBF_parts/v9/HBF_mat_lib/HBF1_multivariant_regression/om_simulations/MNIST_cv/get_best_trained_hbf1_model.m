function [] = get_best_trained_hbf1_model(task_id, changing_params_config, fixed_params_config, results_path)
% gets the best HBF1 model with k centers from the number of initilizations
%% Load paths
disp(task_id);
run('load_paths');
%% load configs
run(changing_params_config);
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
params4mdl_iter = HBF1_iterator4training(center, gau_precision, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda);
params4mdl_iter.create_inits_1layer(X_train,center,D_out);
%% Run Hold Out Cross Validation
%tic
best_mdl_train = train_model_class_iterations_smallest_cv_error(X_train,y_train,X_cv,y_cv, params4mdl_iter);
test_error = compute_Hf_sq_error(X_test,y_test, best_mdl_train, best_mdl_train.lambda );
%% write results to file
%path = './results';
file_name = sprintf('results_om_id%d',task_id);
path_file = sprintf('%s%s',results_path,file_name);
fileID = fopen(path_file, 'w')
fprintf(fileID, '%d %d.txt', center,test_error);
%time_passed = toc;
%time_elapsed(sgd_iterations, time_passed )
end
