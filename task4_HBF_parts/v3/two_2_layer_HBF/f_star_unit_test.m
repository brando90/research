%% f_star unit test
%% Test0
% dimensions
disp('Test 0');
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
% fake data & params
x = (1:Dp*Np)';
c = (1:K2)';
t2 = rand(K1, K2);
t1 = rand(Dp, Dd, Np);
%% do f(x)
[ f_loops, ~, ~, ~, ~ ] = f_star_loops( x, c, t1, t2);
[ f_vectorized, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2);
disp(['f_loops = ', num2str(f_loops)]);
disp(['f_vectorized = ', num2str(f_vectorized)]);
% disp(size(f) == [1, 1])
% disp(size(z_l1) == [Np, Dd])
% disp(size(z_l2) == [K2, 1] )
% disp(size(a_l2) == [Np, Dd] )
% disp(size(a_l3) == [K2 , 1] )
%% Test1 - small example
% dimensions
disp('Test 1');
Dp = 1;
Np = 1;
Dd = 1;
K2 = 3;
K1 = Dd * Np;
% fake data & params
x = (1:Dp*Np)';
c = (1:K2)';
t2 = (1:K2);
t1 = 5;
% do f(x)
[ f_loops, ~, ~, ~, ~ ] = f_star_loops( x, c, t1, t2);
[ f_vectorized, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2);
disp('Should be approx 0.404881')
f_loops
f_vectorized
%% Test 2a - Medium example
% dimensions
disp('Test 2');
% fake data & params
x = 1;
c = 4;
t2 = 3;
t1 = 2;
% do f(x)
[ f_loops, ~, ~, ~, ~ ] = f_star_loops( x, c, t1, t2);
[ f_vectorized, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2);
disp('Should be approx 0.00391961')
f_loops
f_vectorized
%% Test 2b - Medium example
% dimensions
disp('Test 2b');
% fake data & params
x = [1 2 3]';
c = [15 16 17]';
t2 = [1 2; 3 4; 5 6]';
t1 = [5 6 7; 8 9 10]';
% do f(x)
[ f_loops, ~, ~, ~, ~ ] = f_star_loops( x, c, t1, t2);
[ f_vectorized, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2);
disp('Should be approx 0.101069')
f_loops
f_vectorized
%% Test 3 - medium/large example
% dimensions
disp('Test 4');
% fake data & params
x = [1 2 3 4]'
c = [15 16 17, 18]'
t2 = [1 2 3 4 5 6; 6 5 4 3 2 1; 1 1 1 2 2 2; 1 1 2 2 3 3]'
t1 = zeros(2,3,2);
t1(:,:,1) = [1 1; 2 2; 3 3]';
t1(:,:,2) = [1 2; 2 3; 3 4]';
% do f(x)
[ f_loops, ~, ~, ~, ~ ] = f_star_loops( x, c, t1, t2);
[ f_vectorized, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2);
disp('Should be approx 5.943048016e-04')
f_loops
f_vectorized