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
N = 1000;
D = 100;
[X, y] = generate_high_dim_regression( N, D );
%% data set split
per_train = 0.6;
per_cv = 0.3;
%%
beta_start = 0.2;
beta_end = 1;
num_betas = 100;
betas = linspace(beta_start, beta_end, num_betas);
betas(1:10)
%%
train_func = @learn_RBF_linear_algebra;
num_initilizations = 1;
[ c_initilizations,t_initilizations ] = create_initilizations( X, num_initilizations );
gd_iterations = 50;
%%
visualize = 1;
tic
[ best_mdl, error_best_mdl] = hold_out_cross_validation_with_test_data(X,y, per_train,per_cv, betas, train_func,c_initilizations,t_initilizations, gd_iterations, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
error_best_mdl
best_beta = best_mdl.beta
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');