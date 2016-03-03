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
%addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
load('../../common/data/data_MNIST_data4CV_4000.mat'); % data4cv
%data4cv.normalize_data_auto_encoder()
[D, ~] = size(X_train);
%%
beta_start = 0.000001;
beta_end = 0.5;
num_betas = 50
betas = linspace(beta_start, beta_end, num_betas);
%%
beta = inf;
mdl_func = @RBF;
param4mdl_func = @RBF_parameters;
train_func = @learn_RBF_linear_algebra;
gd_iterations = -1; %GD
num_inits = 1;
lambda = 0;
D_out = D;
params4mdl_iter = RBF_iterator4training(beta, mdl_func,param4mdl_func,train_func,gd_iterations,num_inits,lambda);
params4mdl_iter.create_initiliazations(data4cv.X_train,D_out);
%%
visualize = 1;
tic
[ best_mdl, test_error_best_mdl] = hold_out_cross_validation_with_test_data(data4cv, betas, params4mdl_iter, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
test_error_best_mdl
best_beta = best_mdl.beta
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');
beep;