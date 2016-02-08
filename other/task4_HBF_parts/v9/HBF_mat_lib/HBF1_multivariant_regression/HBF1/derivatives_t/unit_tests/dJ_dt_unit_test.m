%% dJ_dt_unit_test
restoredefaultpath;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/squared_error_risk');
%% dJ_dt_unit_test
K = 4;
D = 3;
N = 100;
x = rand(D,1);
y = rand(D,1);
%% reg params
lambda = 0;
mu_c = 1;
%% make mode
c = rand(K,D);
t = rand(D,K);
beta = 1;
mdl_params = HBF1_parameters(c,t,beta,lambda);
mdl = HBF1(mdl_params);
%% Dj_dt
[f_x, z, a] = mdl.f(x);
% compute dJ_dt_vec
dV_dt_vec = compute_dV_dt_vec( f_x,a, x,y, mdl_params  );
% compute compute_dJ_dt_loops
dJ_dt_loops = compute_dJ_dt_loops(f_x,z,x,y,mdl.t,mdl.c);
% compute dJ_dt_numerical
eps = 1e-10;
dJ_dt_numerical = compute_dJ_dt_numerical_derivatives(x,y,mdl.c,mdl.t,mdl.beta,eps);
%% print derivatives
dJ_dt_loops
dV_dt_vec
dJ_dt_numerical