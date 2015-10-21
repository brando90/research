addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/softmax_risk');
%% dJ_dt_unit_test
K = 4;
L = 2;
D = 3;

x = rand(D,1);
y = 1;

c = rand(K,L);
t = rand(D,K);
beta = 1;
mdl = HBF1(c,t,beta)
lambda = 0;

[h_x, z, ~] = h(x,c,t,beta);
dJ_dt = compute_dJ_dt(h_x,z,x,y,t,c);
dJ_dt_vec = compute_dJ_dt_vec(h_x,z,x,y,t,c);
eps = 1e-10;
dJ_dt_numerical = compute_dJ_dt_numerical_derivatives(x,y,c,t,beta,eps);
%% print derivatives
dJ_dt
dJ_dt_vec
dJ_dt_numerical