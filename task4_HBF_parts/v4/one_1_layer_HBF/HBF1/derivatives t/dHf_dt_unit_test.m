%% dHf_dt_unit_test
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
dHf_dt = compute_dHf_dt(X,y,c,t,beta, lambda);
eps = 1e-10;
dHf_dt_numerical = compute_dHf_dt_numerical_derivatives(X,y,c,t,beta, lambda, eps);
%% print derivatives
dHf_dt
dHf_dt_numerical