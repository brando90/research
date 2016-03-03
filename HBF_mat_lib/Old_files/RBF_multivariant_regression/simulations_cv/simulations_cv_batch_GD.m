disp('-------------------------->>> RBF...');
%% Load paths
restoredefaultpath
clear
addpath('../RBF');
addpath('../RBF/model_functions');
addpath('../RBF/update_rules_GD');
addpath('../RBF/update_rules_GD/batch_gradient_descent');
addpath('../RBF/derivatives_c');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
snr = 10;
N = 1000;
D = 20;
D_out = 1;
%% data set split

%%
beta_start = 0.15;
beta_end = 0.6;
num_betas = 200;
betas = linspace(beta_start, beta_end, num_betas)
%% RBF
beta = inf;
mdl_func = @RBF;
param4mdl_func = @RBF_parameters;
train_func = @learn_RBF_batch_GD;
%mu_c = 0.9;
iterations = 1000; %GD
num_inits = 6;
lambda = 0;
params4mdl_iter = RBF_iterator4training(beta, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda);
params4mdl_iter.create_initiliazations(data_for_cross_validation.X_train,D_out);
%%
visualize = 1;
tic
[ best_mdl, error_best_mdl] = hold_out_cross_validation_with_test_data(data_for_cross_validation, betas, params4mdl_iter, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
error_best_mdl
best_beta = best_mdl.beta
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');