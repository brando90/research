%% update C unit test
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
%% call f(x)
[f, ~, ~, ~, a_l3 ] = f_star(x,c,t1,t2);
%% gradient
dJ_df = -2*(y-f);
df_dc = compute_df_dc(a_l3);
dJ_dc = dJ_df*df_dc;
eps = 1e-10;
for i=1:length(c);
    disp('-----index i:');
    disp(i);
    e_i = zeros(K2, 1);
    e_i(i) = eps;
    derivative = (J(y, x, c + e_i, t2, t1) - J(y, x, c - e_i, t2, t1) ) / (2*eps);
    disp('Numerical Derivative');
    disp(derivative);
    disp('dJ_dc');
    disp(dJ_dc(i));
end