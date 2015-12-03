disp('-------------------------->>> RBF...');
%% Load paths
restoredefaultpath
clear
addpath('../RBF');
addpath('../RBF/model_functions');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
load('./all_MNIST_Combine');
per_train = 0.6;
per_cv = 0.3;
data_for_cross_validation = cross_validation_data(X,y,per_train,per_cv);
%%
beta_start = 0.1;
beta_end = 10;
num_betas = 100;
betas = linspace(beta_start, beta_end, num_betas);
%%
beta = inf;
mdl_func = @RBF;
param4mdl_func = @RBF_parameters;
train_func = @learn_RBF_linear_algebra;
gd_iterations = -1; %GD
num_inits = 10;
lambda = 0;
params4mdl_iter = RBF_iterator4training(beta, mdl_func,param4mdl_func,train_func,gd_iterations,num_inits,lambda);
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