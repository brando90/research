disp('-------------------------->>> Running simulations 2 layer HBF...');
%% Create vectors to learn from
addpath('../common')
N = 10
D = 6
Dp = D/2
Dd = 4
Np = 2
[X, y] = generate_supervised_classification_hbf2_2_labels(N, Dp);
disp('---> Size(X) = (D, N)');
disp(size(X));
disp('---> Size(y) = (N, 1)')
disp(size(y));
%% Parameters
%% Learn the parameters
%% Parameters
lambda = 0; %reg param
K = 200; %num hidden units
c = rand(K,1);
t = rand(D,K);
%t = X(:,1:K);
mu_c = 1;
mu_t = 1;
%% Learn the parameters
visualize = 1;
prec = 0.01;
[c_new, t_new] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, prec, visualize);
%% Print some results
disp('Parameters:');
disp('c');
disp(c);
disp('t1');
disp(t1);
disp('t2');
disp(t2);