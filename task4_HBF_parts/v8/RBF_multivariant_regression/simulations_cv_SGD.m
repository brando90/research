disp('-------------------------->>> HBF1...');
%% Load paths
restoredefaultpath
clear
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
%addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
load('../../common/data/data_MNIST_data4CV_1000.mat'); % data4cv
%data4cv.normalize_data_auto_encoder()
[D, ~] = size(X_train);
%%
num_centers_start = 10;
num_centers_end = 20;
amount_of_centers_to_test = 5
centers = floor(linspace(num_centers_start, num_centers_end, amount_of_centers_to_test));
%%
beta = 0.5;
mdl_func = @HBF1;
param4mdl_func = @HBF1_parameters;
train_func = @learn_HBF_SGD;
gd_iterations = 15; %GD
num_inits = 2;
lambda = 0;
D_out = D;
K = inf;
params4mdl_iter = HBF1_iterator4training(K, beta, mdl_func,param4mdl_func,train_func,gd_iterations,num_inits,lambda);
params4mdl_iter.create_initiliazations(data4cv.X_train,D_out);
%%
visualize = 1;
tic
[ best_mdl, test_error_best_mdl] = hold_out_cross_validation_with_test_data_num_centers(data4cv, centers, params4mdl_iter, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
test_error_best_mdl
[~, best_K] = size(best_mdl.t)
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');
beep;