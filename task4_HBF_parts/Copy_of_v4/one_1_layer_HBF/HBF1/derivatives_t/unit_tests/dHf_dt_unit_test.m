addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/softmax_risk');
%% dHf_dt_unit_test
K = 4;
L = 2;
D = 3;
N = 100;
X = rand(D,N);
y = ones(N,1);
%% make mode
c = rand(K,L);
t = rand(D,K);
beta = 1;
%% reg params
lambda = 0;
mu_c = 1;
%% run unit test
dHf_dt = compute_dHf_dt(X,y, c, t, beta, lambda);
eps = 1e-10;
dHf_dt_numerical = compute_dHf_dt_numerical_derivatives(X,y,c,t,beta, lambda, eps);
%% print derivatives
dHf_dt
dHf_dt_numerical