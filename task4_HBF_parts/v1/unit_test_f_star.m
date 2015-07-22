%% Unit test for f_star
x1 = [1; 2; 3; 7];
D = length(x1);
K = 5;
D_p = 10;
C = rand(K, D_p);
t = rand(D, K);
f_star = f_star(x1, C, t);
size(f_star)