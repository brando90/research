disp('-------------------------->>> Running simulations 2 layer HBF...');
%% Create vectors to learn from
addpath('../common')
N = 8;
D = 4;
[X, y] = generate_supervised_classification_hbf2_2_labels(N, D);
disp('---> Size(X) = (D, N)');
disp(size(X));
disp('---> Size(y) = (N, 1)')
disp(size(y));
%% Parameters
%% Learn the parameters
[c, t_1, t_2] = learn_HBF_parameters_2_hidden_layer(X,Y,c,t_1,t_2,lambda,mu_c,mu_t_1,mu_t_2, prec, visualize)
%% Print some results