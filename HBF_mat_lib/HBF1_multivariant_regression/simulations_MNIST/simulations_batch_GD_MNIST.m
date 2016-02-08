disp('-------------------------->>> HBF1...');
%% Load paths
restoredefaultpath
clear
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/update_rules_GD');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
data_set_path = '../../common/data/data_MNIST_data4CV_1000.mat'
load(data_set_path); % data4cv
data4cv.normalize_data();
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
%% HBF
disp('number of centers')
K = 10
beta = 0.5
D_out = D
%c = datasample(X_train', N_train, 'Replace', false);
c = normc(rand(K,D_out)); % (N x D)
t = datasample(X_train', K, 'Replace', false)'; % (D x N)
lambda = 0;
%% params
iterations = 10 %GD
%%
visualize = 1;
tic
mdl_params = HBF1_parameters(c,t,beta,lambda);
mdl_new_params = learn_HBF1_batch_GD( X_train, y_train, mdl_params, iterations,visualize, X_test,y_test);
time_passed = toc;
%%
mdl_new = HBF1(mdl_new_params);
error_best_mdl = compute_Hf_sq_error(X_test,y_test, mdl_new, lambda)
time_elapsed(iterations, time_passed )
beep;