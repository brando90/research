%% dHf_dc_unit_test
restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
addpath('../../../../common/kernel_functions');
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
lambda = 0;
mdl_params = HBF1_parameters(c,t,beta,lambda);
mdl = HBF1(mdl_params);
%%
Kern = produce_kernel_matrix( X, t, beta );
%%
dHf_dc_loops = compute_dHf_dc_loops(X,y, mdl.c,mdl.t,mdl.beta, lambda);
dHF_dc_vec = compute_dHf_dc_vec(Kern,y, c,lambda);
eps = 1e-10;
dHf_dc_numerical = compute_dHf_dc_numerical_derivatives(X,y, mdl.c,mdl.t,mdl.beta, lambda, eps);
%% print derivatives
dHF_dc_vec
dHf_dc_loops
dHf_dc_numerical