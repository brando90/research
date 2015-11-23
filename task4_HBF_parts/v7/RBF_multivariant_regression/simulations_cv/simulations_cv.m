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
%% data set
N = 50;
%D = 1;
%X = rand(D, N);
X = linspace(-10,10,N); %(1 x N)
% y = awgn(X .* X, 1); % (1 X N)
y = (1/3)*sin(3*X).*sin(3*X) + (3/4)*cos(100*X);
% v = (1:D)';
% theta = v/norm(v,2);
% y = awgn(X'*theta, 50)';
%% data set split
per_train = 0.6;
per_cv = 0.3;
%% mdl
train_func = @learn_RBF_linear_algebra;
t = X;
c = inf(N, 1);
beta = inf;
mdl = RBF(c,t,beta);
mdl.lambda = 0;
%%
beta_start = 0.1;
beta_end = 10;
% beta_step = 0.1;
% betas = (beta_start:beta_step:beta_end);
num_betas = 1000;
betas = linspace(beta_start, beta_end, num_betas);
beta_step = (beta_end - beta_start)/num_betas
num_initilizations = 1;
%%
visualize = 1;
tic
[ best_mdl, error_best_mdl] = split_cross_validation(mdl, X,y, per_train,per_cv, betas, train_func,num_initilizations,visualize);
time_passed = toc;
time_elapsed(-3.14159, time_passed )
error_best_mdl
best_beta = best_mdl.beta
Y_pred = best_mdl.predict_data_set(X);
figure;
plot(X, Y_pred, '-ro',X, y, '-b*')
legend('prediction','truth');