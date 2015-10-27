%% dHf_dc_unit_test
K = 4;
L = 2;
D = 3;
N = 100;
X = rand(D,N);
y = ones(N,1);
c = rand(K,L);
t = rand(D,K);
lambda = 0;
mu_c = 1;
beta = 1;
dHf_dc = compute_dHf_dc(X,y,c,t,beta, lambda);
eps = 1e-10;
dHf_dc_numerical = compute_dHf_dc_numerical_derivatives(X,y,c,t,beta, lambda, eps);
%% print derivatives
dHf_dc
dHf_dc_numerical