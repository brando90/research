%% Benchmarks
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
snr = 10;
N = 1000;
D = 1000
D_out = D
[X, y] = generate_high_dim_regression( N, D, D_out, snr);
%% data set split
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
num_inits = 1;
lambda = 0;
%%
visualize = 0;
D_start = 20;
D_end = 1000;
num_D = 10;
dims = floor(linspace(D_start,D_end, num_D))
times = zeros(1,num_D);
for i=1:num_D
    D_current = dims(i)
    d4cv = cross_validation_data(X,y,per_train,per_cv);
    d4cv.X_train = d4cv.X_train(1:D_current,:);
    d4cv.X_cv = d4cv.X_cv(1:D_current,:);
    d4cv.X_test = d4cv.X_test(1:D_current,:);
    d4cv.y_train = d4cv.y_train(1:D_current,:);
    d4cv.y_cv = d4cv.y_cv(1:D_current,:);
    d4cv.y_test = d4cv.y_test(1:D_current,:);
    D_out = D_current;
    params4mdl_iter = RBF_iterator4training(beta, mdl_func,param4mdl_func,train_func,gd_iterations,num_inits,lambda);
    params4mdl_iter.create_initiliazations(d4cv.X_train,D_out);
    tic
    [ ~, ~] = hold_out_cross_validation_with_test_data(d4cv, betas, params4mdl_iter, visualize);
    time_passed = toc/60
    times(i) = time_passed; % in minutes
end
%% Plot function
figure;
plot(dims, times, '-ro')
legend('time passed');
beep;