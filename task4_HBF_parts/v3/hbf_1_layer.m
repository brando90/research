%% Create vectors to learn from
N = 200;
D = 4*10;
[X, y] = generate_supervised_classification_dummy_data_set(N, D);
%% Parameters
lambda = 0;
num_hidden_units = 4*3;
%% Learn the parameters
