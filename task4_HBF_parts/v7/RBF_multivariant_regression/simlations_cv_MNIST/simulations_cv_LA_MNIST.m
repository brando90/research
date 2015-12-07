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
load('../../common/data/all_MNIST_Combine.mat');
per_train = 0.3;
per_cv = 0.3;
data4cv = cross_validation_data(X,Y,per_train,per_cv);

num_labels = 10;
amount_per_label = 100;

[X_train, ~] = get_balanced_data_set( data4cv.X_train, data4cv.y_train, amount_per_label, num_labels );
[X_cv, ~] = get_balanced_data_set( data4cv.X_cv, data4cv.y_cv, amount_per_label, num_labels );
[X_test, ~] = get_balanced_data_set( data4cv.X_test, data4cv.y_test, amount_per_label, num_labels );
data4cv.change_data_sets(X_train,X_cv,X_test, X_train,X_cv,X_test)
[D, ~] = size(X_train);
%%
beta_start = 0.5;
beta_end = 1;
num_betas = 2;
betas = linspace(beta_start, beta_end, num_betas)

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
visualize = 0;
tic
[ best_mdl, error_best_mdl] = hold_out_cross_validation_with_test_data(data4cv, betas, params4mdl_iter, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
error_best_mdl
best_beta = best_mdl.beta
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');
beep;