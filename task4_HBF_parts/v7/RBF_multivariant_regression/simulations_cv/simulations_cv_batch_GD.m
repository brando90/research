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
N = 1000;
D = 100;
[X, y] = generate_high_dim_regression( N, D );
%% data set split
per_train = 0.6;
per_cv = 0.3;
data_for_cross_validation = cross_validation_data(X,y,per_train,per_cv);
%%
beta_start = 0.2;
beta_end = 1;
num_betas = 100;
betas = linspace(beta_start, beta_end, num_betas);
%% RBF
beta = inf;
train_func = @learn_RBF_batch_GD;
mu_c = 0.9;
num_initilizations = 10;
iterations = 10; %GD
lambda = 0;
params4mdl = RBF_parameters4training(beta,train_func,mu_c,iterations,num_initilizations,lambda);
D_out = 1;
params4mdl.create_initilizations(X,D_out);
mdl2train_init_func = @RBF;
%%
visualize = 1;
tic
[ best_mdl, error_best_mdl] = hold_out_cross_validation_with_test_data(data_for_cross_validation, betas, mdl2train_init_func,params4mdl, visualize);
time_passed = toc;
time_elapsed(-1, time_passed )
error_best_mdl
best_beta = best_mdl.beta
%% Plot function
%Y_pred = best_mdl.predict_data_set(X);
%figure;
%plot(X, Y_pred, '-ro',X, y, '-b*')
%legend('prediction','truth');