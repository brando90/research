%% update t2 unit test
%% dimensions
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
L=3;
%% fake data & params
x = (1:Dp*Np)';
y = 1;
c = rand(K2,L);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
sig = 1;
%% call f(x)
[ f_x, z_l1, z_l2, a_l2, ~ ] = f(x, c,t1,t2,sig);
%% gradient
[~, dJ_dt2] = update_t2_gradient(t2, f_x,y, z_l2,a_l2,c,sig, 0, 0);
eps = 1e-10;
for k1=1:K1;
    for k2=1:K2
        disp('===');
        e_k1k2 = zeros(K1, K2);
        e_k1k2(k1,k2) = eps;
        numerical_derivative = (J(x,y, c,t1,t2+e_k1k2,sig) - J(x,y, c,t1,t2-e_k1k2,sig) ) / (2*eps);
        disp('k1, k2')
        disp([k1,k2]);
        disp('Numerical Derivative');
        disp(numerical_derivative);
        disp('dJ_dt2');
        disp(dJ_dt2(k1,k2));
    end
end