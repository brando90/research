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
K = 4;
D = 3;
x = rand(D,1);
y = rand(D,1);
%% HBF1 params
c = rand(K,D);
t = rand(D,K);
mdl = HBF1(c,t,beta);
lambda = 0;
%%
[f_x, ~, a] = mdl.f(x);
dJ_dc = compute_dJ_dc_loops(f_x,y,a);
eps = 1e-10;
dJ_dc_numerical = compute_dJ_dc_numerical_derivatives(x,y,c,t,beta,eps);
%% print derivatives
dJ_dc
dJ_dc_numerical