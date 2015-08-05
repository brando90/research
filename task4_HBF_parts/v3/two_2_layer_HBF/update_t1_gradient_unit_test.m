%% update t1 unit test
%% dimensions
Dp = 3
Np = 4
Dd = 2
K2 = 5
K1 = Dd * Np
%% fake data & params
x = (1:Dp*Np)';
c = (1:K2)';
t2 = rand(K1, K2);
t1 = rand(Dp, Dd, Np);
lambda = 0;
mu_t1 = 1;
%% call f(x)
[ f, z_l1, z_l2, a_l2, ~ ] = f_star( x, c, t_1, t_2, Np, Dp );
%% update gradient
t1 = update_t1_gradient(t1,x,y,f,z_l1,z_l2,a_l2,c,t2,lambda,mu_t1,Dp);
disp(t1);