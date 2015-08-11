%% f_star unit test
%% Test1
%% dimensions
disp('Test 1');
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
[ f, z_l1, z_l2, a_l2, a_l3 ] = f_star( x, c, t_1, t_2, Np, Dp );
disp(['f = ', num2str(f)]);
disp(size(f) == [1, 1])
disp(size(z_l1) == [Np, Dd])
disp(size(z_l2) == [K2, 1] )
disp(size(a_l2) == [Np, Dd] )
disp(size(a_l3) == [K2 , 1] )
%% Test2
%% dimensions
disp('Test 2');
Dp = 1;
Np = 1;
Dd = 1;
K2 = 3;
K1 = Dd * Np;
%% fake data & params
x = (1:Dp*Np)'
c = (1:K2)'
t_2 = (1:K2)
t_1 = 5
%% do f(x)
[ f, z_l1, z_l2, a_l2, a_l3 ] = f_star_loop( x, c, t1, t2, Np, Dp )
disp(['f = ', num2str(f)]);
disp(size(f) == [1, 1])
disp(size(z_l1) == [Np, Dd])
disp(size(z_l2) == [K2, 1] )
disp(size(a_l2) == [Np, Dd] )
disp(size(a_l3) == [K2 , 1] )