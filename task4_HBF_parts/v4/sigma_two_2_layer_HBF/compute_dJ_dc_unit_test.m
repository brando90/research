%% dJ_dc unit test
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
[h_x, ~, ~, ~, a_l3 ] = h(x, c,t1,t2,sig);
%% gradient
[~, dJ_dc] = update_c_gradient(c, h_x,y, a_l3, mu_c, lambda); %(K2 x L)
eps = 1e-5;
for k2=1:K2
    for l=1:L
        disp('-------------------------------------------');
        disp('=>index k2,l:');
        disp([k2, l]);
        e_k2 = zeros(K2, L);
        e_k2(k2,l) = eps;
        numerical_derivative = (J(x,y, c+e_k2,t1,t2,sig) - J(x,y, c-e_k2,t1,t2,sig) ) / (2*eps);
        disp('Numerical Derivative');
        disp(derivative);
        disp('dJ_dc');
        disp(dJ_dc(k2,l));
    end
end
disp('-------------------------------------------');