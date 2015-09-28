%% update t1 unit test
%% Test 1: 
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
L=3;
%% fake data & params
x = rand(1,Dp*Np)';
y = 1;
c = rand(K2,L);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
sig = 1;
%% call f(x)
[f_x, z_l1, z_l2, a_l2, a_l3 ] = f(x, c,t1,t2,sig);
%% gradient
[~, dJ_dt1] = update_t1_gradient(t1, f_x,x,y, z_l1,z_l2,a_l2, c,t2,sig, 0,0);
eps = 1e-5;
%% numerical derivative
dJ_dt1_numerical = compute_dJ_dt1_numerical(eps, x,y, c,t1,t2,sig);
for np=1:Np
    np
    dJ_dt1_numerical_np = dJ_dt1_numerical(:,:,np)
    dJ_dt1_np = dJ_dt1(:,:,np)
end