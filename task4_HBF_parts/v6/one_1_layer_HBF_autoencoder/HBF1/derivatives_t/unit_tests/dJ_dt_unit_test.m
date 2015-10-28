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
x = rand(D,1);
y = rand(D,1);
beta = 1;
c = rand(K,D);
t = rand(D,K);
mdl = HBF1(c,t,beta);
lambda = 0;

[f_x, z, ~] = mdl.f(x);
dJ_dt_loops = compute_dJ_dt_loops(f_x,z,x,y,mdl.t,mdl.c);
%dJ_dt_vec = compute_dJ_dt_vec(f_x,z,x,y,t,c);
eps = 1e-10;
dJ_dt_numerical = compute_dJ_dt_numerical_derivatives(x,y,mdl.c,mdl.t,mdl.beta,eps);
%% print derivatives
dJ_dt_loops
%dJ_dt_vec
dJ_dt_numerical