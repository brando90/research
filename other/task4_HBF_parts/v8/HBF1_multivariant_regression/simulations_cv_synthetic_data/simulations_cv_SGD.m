disp('-------------------------->>> HBF1...');
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
addpath('../../common/data_generation/simple_regression_example_high_dimensions')
addpath('../../common/MNIST')
addpath('../../common/kernel_functions')
%addpath('../../common/data_generation/simple_regression_example_high_dimensions')
%% data set
snr = 10;
N = 3000;
D = 300
D_out = 100
[X, y] = generate_high_dim_regression( N, D, D_out, snr);
%% data set split
per_train = 0.6;
per_cv = 0.3;
data4cv = cross_validation_data(X,y,per_train,per_cv);
%% number of centers to train/test
num_centers_start = 5;
num_centers_end = 200;
amount_of_centers_to_test = 100
centers = floor(linspace(num_centers_start, num_centers_end, amount_of_centers_to_test));
%% preparing models to train/test for mdl_iterator
beta = 0.06;
mdl_func = @HBF1;
param4mdl_func = @HBF1_parameters;
train_func = @learn_HBF_SGD;
sgd_iterations = 6100; %SGD
num_inits = 5;
lambda = 0;
K = inf;
params4mdl_iter = HBF1_iterator4training(K, beta, mdl_func,param4mdl_func,train_func,sgd_iterations,num_inits,lambda);
params4mdl_iter.create_initiliazations(data4cv.X_train,D_out);
%% Run Hold Out Cross Validation
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