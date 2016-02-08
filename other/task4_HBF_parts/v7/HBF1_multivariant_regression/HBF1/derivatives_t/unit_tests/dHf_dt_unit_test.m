%% dHf_dt_unit_test
restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
addpath('../../../../common/kernel_functions');
%% dHf_dt_unit_test
K = 4;
D = 3;
N = 100;
X = rand(D,N);
y = rand(D,N);
%% reg params
lambda = 0;
mu_c = 1;
%% make mode
c = rand(K,D);
t = rand(D,K);
beta = 1;
mdl_params = HBF1_parameters(c,t,beta,lambda);
%%
Kern = produce_kernel_matrix( X, t, beta );
F = Kern * mdl_params.c;
%% run unit test
dHf_dt_loops = compute_dHf_dt_loops(X,y, c, t, beta, lambda);
eps = 1e-10;
dHf_dt_numerical = compute_dHf_dt_numerical_derivatives(X,y,c,t,beta, lambda, eps);
dHf_dt_vec = compute_dHf_dt_vec(F,Kern, X,y, mdl_params );
%% print derivatives
dHf_dt_loops
dHf_dt_numerical
dHf_dt_vec