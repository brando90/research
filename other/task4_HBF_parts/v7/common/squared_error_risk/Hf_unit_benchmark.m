%% Benchmark
restoredefaultpath
clear
addpath('../../RBF_multivariant_regression/RBF');
addpath('../../RBF_multivariant_regression/RBF/model_functions');
addpath('../kernel_functions');
N = 1000;
K = 750;
D = 500;
X = rand(D, N);
y = rand(D, N);
%% RBF
beta = 1;
c = rand(K, D);
t = rand(D, K);
mdl = RBF(c, t, beta);
lambda = 0;
%% Run test
disp('running test')
compute_Hf_sq_error_vec( X,y, mdl, lambda )
%compute_Hf_sq_error_loops( X,y, mdl, lambda )