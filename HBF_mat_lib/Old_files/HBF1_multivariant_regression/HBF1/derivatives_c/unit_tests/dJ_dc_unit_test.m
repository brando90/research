%% dJ_dc_unit_test
restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
%%
K = 5;
D = 4;
x = rand(D,1);
y = rand(D,1);
%% HBF1 params
c = rand(K,D);
t = rand(D,K);
lambda = 0;
beta = 1;
mdl_params = HBF1_parameters(c,t,beta,lambda);
mdl = HBF1(mdl_params);
%%
[f_x, ~, a] = mdl.f(x);
eps = 1e-10;
%% compute dV_dc or dJ_dc
dJ_dc_loops = compute_dJ_dc_loops(f_x,y,a);
dJ_dc_numerical = compute_dJ_dc_numerical_derivatives(x,y,c,t,beta,eps);
dV_dc_vec = compute_dV_dc_vec( f_x,a, y );
%% print derivatives
dJ_dc_loops
dJ_dc_numerical
dV_dc_vec