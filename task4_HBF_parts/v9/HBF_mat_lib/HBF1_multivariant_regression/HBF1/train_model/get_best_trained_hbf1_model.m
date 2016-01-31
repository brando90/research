function [] = get_best_trained_hbf1_model( K, beta, num_inits, iterations, train_alg, lambda, dir_name_4_current_sim)
% gets the best HBF1 model with k centers from the number of initilizations
%% Load paths
restoredefaultpath
clear
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/update_rules_GD/Stochastic_gracient_descent');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
%% load data sets
disp('get_best_trained_hbf1_model ')
data_set_path = '../../common/data/data_MNIST_data4CV_1000.mat';
load(data_set_path); % data4cv
data4cv.normalize_data();
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
%% preparing models to train/test for mdl_iterator
mdl_func = @HBF1;
param4mdl_func = @HBF1_parameters;
train_func = str2func(train_alg); %learn_HBF_SGD
D_out = D;
params4mdl_iter = HBF1_iterator4training(K, beta, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda);
params4mdl_iter.create_inits_1layer(X_train,K,D_out);
%% Run Hold Out Cross Validation
%tic
best_mdl_train = train_model_class_iterations_smallest_cv_error(X_train,y_train,X_cv,y_cv, params4mdl_iter);
test_error = compute_Hf_sq_error(X_test,y_test, best_mdl_train, best_mdl_train.lambda );
%% write to file
path = sprintf('../../../../dispatcher_scripts/HBF1_vs_RBF/simulations_results/%s', dir_name_4_current_sim);
dtm = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z');
file_name = sprintf('results_%s_%s_%s_%s_%s_%s_',dtm.Day,dtm.Month,dtm.Year,dtm.Hour,dtm.Minute,dtm.Second);
fileID = fopen(strcat(path,file_name), 'w'); %open or creates a file on path
fprintf(fileID, '%d,%d\n', K,test_error);
%time_passed = toc;
%time_elapsed(sgd_iterations, time_passed )
end