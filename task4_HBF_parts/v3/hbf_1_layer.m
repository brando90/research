%% Create vectors to learn from
N = 200; %size of data
D = 4*10; %dim of data
[X, y] = generate_supervised_classification_dumy_data_set(N, D);
%% Parameters
lambda = 0; %reg param
K = 4*3; %num hidden units
c = rand(K,1);
t = rand(D,K);
mu_c = 0.01;
mu_t = 0.01;
%% Learn the parameters
visualize = 1;
prec = 0.2;
%iterations = 0;
[c, t] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, prec, visualize);