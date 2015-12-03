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
snr = 5;
D_out = 1;
N_train = 1400;
D_train = 20;
[X_train, y_train] = generate_high_dim_regression( N_train, D_train, D_out, snr);
N_test = 700;
D_train = 20
[X_test, y_test] = generate_high_dim_regression( N_test, D_train, D_out, snr);
%% RBF
beta = 0.5;
c = rand(N_train,D_out); % (N x D)
%c = datasample(X_train', N_train, 'Replace', false);
t = datasample(X_train', N_train, 'Replace', false)'; % (D x N)
lambda = 0;
%% params
iterations = -1; %GD
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