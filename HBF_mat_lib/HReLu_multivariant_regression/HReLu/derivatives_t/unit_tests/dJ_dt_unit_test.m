%% dJ_dt_unit_test
clear;restoredefaultpath;clear;
addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules_GD');
addpath('../../model_functions');
addpath('../../../../common/squared_error_risk');
%% dJ_dt_unit_test
K = 5;
D = 2;
x = rand(D,1);
x = [x; 1];
y = rand(D,1);
%% reg params
lambda = 0;
%% make mode
c = rand(K,D);
t = rand(D+1,K) - 0.5;
mdl = HReLu(c,t,lambda);
%% Dj_dt
[f_x, z, a] = mdl.f(x);
%% compute dJ_dt_numerical
eps = 1e-4;
dJ_dt_numerical = compute_dJ_dt_numerical_derivatives(x,y,mdl.c,mdl.t,eps);
%% compute dJ_dt_vec
dV_dt_vec = compute_dV_dt_vec( f_x,a,z, x,y, mdl  );
%% compute compute_dJ_dt_loops
dJ_dt_loops = compute_dJ_dt_loops(f_x,a,z, x,y,mdl.t,mdl.c);
%% print derivatives
dJ_dt_numerical
dJ_dt_loops
dV_dt_vec