disp('Running simulations...');
%% Create vectors to learn from
N = 100; %size of data
D = 4*10; %dim of data
[X, y] = generate_supervised_classification_dumy_data_set(N, D);
%% Parameters
lambda = 0; %reg param
K = 4*4; %num hidden units
c = rand(K,1);
t = rand(D,K);
mu_c = 0.1;
mu_t = 0.1;
%% Learn the parameters
visualize = 1;

%prec = 0.001;
%[c_new, t_new] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, prec, visualize);

iterations = 500;
[c_new, t_new] = learn_HBF_parameters_1_hidden_layer_iterations(X, y, c, t, lambda, mu_c, mu_t, iterations, visualize);

%% Print some results
initial_error = compute_Hf(X, y, c, t, lambda);
disp('initial error: ');
disp(initial_error);
final_error = compute_Hf(X, y, c_new, t_new, lambda);
disp('final error (after training): ');
disp(final_error);