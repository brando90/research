restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
%% dHf_dt_unit_test
K = 4;
D = 3;
N = 100;
X = rand(D,N);
y = rand(D,N);
%% make mode
c = rand(K,D);
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