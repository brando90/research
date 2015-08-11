%% update t2 unit test
%% dimensions
disp('-------------------------------------------------------------------------------');
Dp = 1;
Np = 1;
Dd = 1;
K2 = 3
K1 = Dd * Np
%% fake data & params
x = (1:Dp*Np)'
y = 3
c = (1:K2)'
% t2 = rand(K1, K2)
% t1 = rand(Dp, Dd, Np)
t1 = [5]
t2 = [1 2 3] % (K1 x K2) = (1 x 3)
%% call f(x)
[ f, z_l1, z_l2, a_l2, ~ ] = f_star(x,c,t1,t2,Np,Dp)
%% gradient
dJ_dt2 = compute_t2_gradient(t2,c,y,f,z_l2,a_l2);
dJ_dt2_loops = compute_t2_gradient_loops(t2,c,y,f,z_l2,a_l2);
eps = 1e-10;
for k1=1:K1;
    for k2=1:K2
        disp('===');
        e_k1k2 = zeros(K1, K2);
        e_k1k2(k1,k2) = eps
        %derivative = (J(y, x, c, t2 + e_k1k2, t1, Np, Dp) - J(y, x, c , t2 - e_k1k2, t1, Np, Dp) ) / (2*eps);
        derivative = (f_star(x, c, t1, t2 + e_k1k2, Np, Dp) - f_star(x, c , t1, t2 - e_k1k2, Np, Dp) ) / (2*eps);
        disp('k1, k2')
        disp([k1,k2]);
        disp('Numerical Derivative');
        disp(derivative);
        disp('dJ_dt2');
        disp(dJ_dt2(k1,k2));
        disp('dJ_dt2_loops');
        disp(dJ_dt2_loops(k1,k2));
    end
end