%% update C unit test
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
%c = (1:K2)';
c = rand(K2,L);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
sig = 1;
%% call f(x)
[f_x, ~, ~, ~, a_l3 ] = f(x, c,t1,t2,sig);
%% gradient
df_dc = compute_df_dc(a_l3,L); %(K2 x L)
dJ_df = compute_dJ_df(f_x,y,K2); %(K2 x L)
dJ_dc = dJ_df.*df_dc; %(K2 x L)
eps = 1e-5;
for k2=1:K2
    for l=1:L
        disp('-----index k2,l:');
        disp([k2, l]);
        e_i = zeros(K2, L);
        e_i(k2,l) = eps;
        derivative = (J(x,y, c+e_i,t1,t2,sig) - J(x,y, c-e_i,t1,t2,sig) ) / (2*eps);
        disp('Numerical Derivative');
        disp(derivative);
        disp('dJ_dc');
        disp(dJ_dc(k2,l));
    end
end