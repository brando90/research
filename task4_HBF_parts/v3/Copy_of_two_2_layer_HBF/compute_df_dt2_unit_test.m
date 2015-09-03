%% update t2 unit test
%% dimensions
disp('-------------------------------------------------------------------------------');
%% fake data & params
% x = (1:Dp*Np)'
% y = 3
% c = (1:K2)'
% t2 = rand(K1, K2)
% t1 = rand(Dp, Dd, Np)
x = 1
c = [10 11 12]'
t1 = 1
t2 = [1 2 3] % (K1 x K2) = (1 x 3)
K1 = 1;
K2 = 3;
%% call f(x)
[ f_x, z_l1, z_l2, a_l2, ~ ] = f(x, c,t1,t2,sig);
%% gradient
%dJ_dt2_vectorized = compute_df_dt2_vectorized(t2,c,z_l2,a_l2);
dJ_dt2_loops = compute_df_dt2_loops(t2, z_l2,a_l2, c,sig);
eps = 1e-10;
for k1=1:K1;
    for k2=1:K2
        disp('===');
        e_k1k2 = zeros(K1, K2);
        e_k1k2(k1,k2) = eps;
        %derivative = (J(y, x, c, t2 + e_k1k2, t1, Np, Dp) - J(y, x, c , t2 - e_k1k2, t1, Np, Dp) ) / (2*eps);
        derivative = (f(x, c,t1,t2+e_k1k2,sig) - f(x, c,t1,t2-e_k1k2,sig) ) / (2*eps);
        disp('k1, k2')
        disp([k1,k2]);
        disp('Numerical Derivative');
        disp(derivative);
%         disp('dJ_dt2_vectorized');
%         disp(dJ_dt2_vectorized(k1,k2));
        disp('dJ_dt2_loops');
        disp(dJ_dt2_loops(k1,k2));
    end
end