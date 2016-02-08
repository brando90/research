%% Unit test for f_star_all_data
x1 = [1; 2; 3; 7];
x2 = [4; 5; 6; 8];
X_data = [x1; x2];
[D, N] = size(X_data);
D_p = D; %output dimension = input dimension
K = 5;
C = rand(K, D_p);
t = rand(D, K);
F_star = f_star_all_data(X_data, C, t);
size(F_star)
size(X_data)