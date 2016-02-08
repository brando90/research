%% dJ_dc_unit_test
K = 4;
L = 2;
D = 3;
x = rand(D,1);
y = 1;
c = rand(K,L);
t = rand(D,K);
lambda = 0;
beta = 1;
[h_x, ~, a] = h(x,c,t,beta);
dJ_dc = compute_dJ_dc(h_x,y,a);
eps = 1e-10;
dJ_dc_numerical = compute_dJ_dc_numerical_derivatives(x,y,c,t,beta,eps);
%% print derivatives
dJ_dc
dJ_dc_numerical