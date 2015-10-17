%% dh_dc_unit_test
K = 4;
L = 2;
D = 3;
x = rand(D,1);
c = rand(K,L);
t = rand(D,K);
lambda = 0;
beta = 1;
[~, a] = h(x,c,t,beta);
df_dc = compute_dh_dc(a,L);
eps = 1e-10;
df_dc_numerical = compute_dh_dc_numerical_derivatives(x,c,t,beta,eps);
%% print derivatives
df_dc
df_dc_numerical