disp('-------------------------->>> RBF...');
%% Load paths
restoredefaultpath
clear
addpath('../RBF');
addpath('../RBF/model_functions');
addpath('../RBF/update_rules_GD');
addpath('../RBF/update_rules_GD/batch_gradient_descent');
addpath('../RBF/derivatives_c');
addpath('../RBF/analytic_tools_analysis_HBF1_GD');
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
[D, N_train] = size(X_train);
%% RBF
beta = 0.5
D_out = D
c = rand(N_train,D_out); % (N x D)
%c = datasample(X_train', N_train, 'Replace', false);
t = datasample(X_train', N_train, 'Replace', false)'; % (D x N)
lambda = 0;
%% params
iterations = -1; %GD
disp('Linear Algebra')
%%
visualize = 1;
tic
mdl_params = RBF_parameters(c,t,beta,lambda);
mdl_new_params = learn_RBF_linear_algebra( X_train, y_train, mdl_params );
time_passed = toc;
%%
mdl_new = RBF(mdl_new_params);
error_best_mdl = compute_Hf_sq_error(X_test,y_test, mdl_new, lambda)
time_elapsed(iterations, time_passed )