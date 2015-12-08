%% dHf_dc_unit_test
restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
%%
N = 5000;
K = 4;
D = 3;
X = rand(D,N);
y = rand(D,N);
%% HBF1 params
c = rand(K,D);
t = rand(D,K);
beta = 1;
mdl = HBF1(c,t,beta);
lambda = 0;
%%
dHf_dc = compute_dHf_dc(X,y, mdl.c,mdl.t,mdl.beta, lambda);
dHF_dc_vec = compute_dHf_dc_vec(X,y, mdl.c,mdl.t,mdl.beta, lambda);
eps = 1e-10;
dHf_dc_numerical = compute_dHf_dc_numerical_derivatives(X,y, mdl.c,mdl.t,mdl.beta, lambda, eps);
%% print derivatives
dHF_dc_vec
dHf_dc
dHf_dc_numerical