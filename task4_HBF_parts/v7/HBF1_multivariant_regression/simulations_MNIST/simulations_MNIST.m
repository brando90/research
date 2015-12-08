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
load('../../common/data/all_MNIST_Combine.mat');
num_labels = 10;
amount_per_label = 100;
[X_train, ~] = get_balanced_data_set( X_training_data, Y_training_labels, amount_per_label, num_labels );
[X_test, ~] = get_balanced_data_set( X_test_data, Y_test_labels, amount_per_label, num_labels );
[D, N_train] = size(X_train);
y_train = X_train;
y_test = X_test;
%% RBF
D_out = D;
beta = 0.5;
K = 10;
%c = datasample(X_train', N_train, 'Replace', false);
c = rand(K,D_out); % (N x D)
t = datasample(X_train', K, 'Replace', false)'; % (D x N)
lambda = 0;
%% params
iterations = 1; %GD
%%
visualize = 0;
tic
mdl_params = HBF1_parameters(c,t,beta,lambda);
mdl_new_params = learn_HBF1_batch_GD( X_train, y_train, mdl_params, iterations,visualize, X_test,y_test);
time_passed = toc;
%%
mdl_new = HBF1(mdl_new_params);
error_best_mdl = compute_Hf_sq_error(X_test,y_test, mdl_new, lambda)
time_elapsed(iterations, time_passed )
beep;