%% update t1 unit test
%% dimensions
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
%% fake data & params
x = (1:Dp*Np)';
y = 3;
c = (1:K2)';
t2 = rand(K1, K2);
t1 = rand(Dp, Dd, Np);
lambda = 0;
mu_t1 = 1;
%% call f(x)
[f, z_l1, z_l2, a_l2, ~ ] = f_star(x,c,t1,t2,Np,Dp);
%% update gradient
dJ_dt1_ij_loops = compute_t1_gradient_loops(t1,x,y,f,z_l1,z_l2,a_l2,c,t2);
dJ_dt1 = compute_t1_gradient(t1,x,y,f,z_l1,z_l2,a_l2,c,t2,lambda);
eps = 1e-10;
e_111 = zeros( size(t1) );
e_111(1,1,1) = eps;
derivative = (J(y, x, c, t2, t1 + e_111, Np, Dp) - J(y, x, c, t2, t1  - e_111, Np, Dp) ) / (2*eps);
derivative
disp('dJ_dt1_ij_loops')
dJ_dt1_ij_loops(1,1,1)
disp('dJ_dt1')
dJ_dt1(1,1,1)