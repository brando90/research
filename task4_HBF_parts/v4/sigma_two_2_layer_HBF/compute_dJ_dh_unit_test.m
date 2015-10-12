%% dJ_dh unit test
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
[h_x, ~, ~, ~, a_l3 ] = h(x, c,t1,t2,sig)
%% gradient
dJ_dh = compute_dJ_dh(h_x,y,K2) %(K2 x L)
numerical_dh_dc = zeros(K2, L);
eps = 1e-10;
for k2=1:K2
    for l=1:L
        disp('-------------------------------------------');
        disp('=>index k2,l:');
        disp([k2, l]);
        e_k2 = zeros(K2, L);
        e_k2(k2,l) = eps;
        numerical_derivative = (J(x,y, c+e_k2,t1,t2,sig) - J(x,y, c-e_k2,t1,t2,sig) ) / (2*eps);
        numerical_dh_dc = numerical_derivative;
        disp('numerical_derivative(k2,l)');
        disp(numerical_dh_dc);
        disp('dJ_dc(k2,l)');
        disp(dJ_dc(k2,l));
    end
end
disp('-------------------------------------------');