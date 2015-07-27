%% Create vectors to learn from
N = 200; %size of data
D = 4*10; %dim of data
[X, y] = generate_supervised_classification_dumy_data_set(N, D);
%% Parameters
lambda = 0; %reg param
K = 4*3; %num hidden units
c = rand(K,1);
t = rand(D,K);
mu_c = 1;
mu_t = 1;
%% Learn the parameters
visualize = 1;
err = 1;
iterations = 0;
[c, t] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, err, iterations, visualize);