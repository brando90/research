%% dh_dt unit test
disp('==----');
K = 4;
L = 2;
D = 3;
x = rand(D,1);
c = rand(K,L);
t = rand(D,K);
lambda = 0;
beta = 1;
[~, z, ~] = h(x,c,t,beta);
dh_dt = zeros([D, K, L]);
for l=1:L
    c_l = c(:,l);
    dh_dt(:,:,l) = compute_dh_dt(z,x,t,c_l);
end
eps = 1e-10;
dh_dt_numerical = compute_dh_dt_numerical_derivatives(x,c,t,beta,eps);
%% print derivatives
dh_dt
disp('----');
dh_dt_numerical