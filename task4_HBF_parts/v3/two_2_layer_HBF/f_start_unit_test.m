%% f_start unit test
%% dimensions
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
%% fake data & params
x = (1:Dp*Np)';
c = (1:K2)';
t_2 = rand(K1, K2);
t_1 = rand(Dp, Dd, Np);
%% do f(x)
f = f_start( x, c, t_1, t_2, Np, Dp );
disp(f);