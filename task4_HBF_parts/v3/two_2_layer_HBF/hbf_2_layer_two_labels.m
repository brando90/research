disp('-------------------------->>> 2HBF...');
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
K1 = Dd * Np;
K2 = 5;
c = rand(K2, 1);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
mu_c = 0.9;
mu_t1 = 0.9;
mu_t2 = 0.9;
prec = 0.5;
visualize = 1;
lambda = 0;
%% Learn the parameters
%[c, t1, t2] = learn_HBF_parameters_2_hidden_layer(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, prec, visualize);
[c, t1, t2] = learn_HBF_parameters_2_hidden_layer_iterations(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, visualize);
%% Print some results
disp('Parameters:');
disp('c');
disp(c);
disp('t1');
disp(t1);
disp('t2');
disp(t2);