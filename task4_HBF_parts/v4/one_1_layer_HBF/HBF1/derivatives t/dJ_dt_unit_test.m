%% dJ_dt_unit_test
K = 4;
L = 2;
D = 3;

x = rand(D,1);
y = 1;

c = rand(K,L);
t = rand(D,K);
lambda = 0;
beta = 1;

[h_x, z, ~] = h(x,c,t,beta);
dJ_dt = compute_dJ_dt(h_x,z,x,y,t,c);
dJ_dt_vec = compute_dJ_dt_vec(h_x,z,x,y,t,c);
eps = 1e-10;
dJ_dt_numerical = compute_dJ_dt_numerical_derivatives(x,y,c,t,beta,eps);
%% print derivatives
dJ_dt
dJ_dt_vec
dJ_dt_numerical