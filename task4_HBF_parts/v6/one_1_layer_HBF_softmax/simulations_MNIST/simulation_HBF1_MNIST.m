disp('------------->>> Running simulations 1 layer HBF...');
%% Create vectors to learn from
%N = 100; %size of data
%D = 4*10; %dim of data
%[X, y] = generate_supervised_classification_dumy_data_set(N, D);
addpath('../common')
X = loadMNISTImages('../common/data/train-images-idx3-ubyte');
y = loadMNISTLabels('../common/data/train-labels-idx1-ubyte');
[D, ~] = size(X);
N = 1000;
X = X(:,1:N);
size(X(:,1))
y = y(1:N);
disp('---> Size(X) = (D, N)');
disp(size(X));
disp('---> Size(y) = (N, 1)')
disp(size(y));
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
%iterations = 500;
%[c_new, t_new] = learn_HBF_parameters_1_hidden_layer_iterations(X, y, c, t, lambda, mu_c, mu_t, iterations, visualize);
%% Print some results
initial_error = compute_Hf(X, y, c, t, lambda);
disp('initial error: ');
disp(initial_error);
final_error = compute_Hf(X, y, c_new, t_new, lambda);
disp('final error (after training): ');
disp(final_error);