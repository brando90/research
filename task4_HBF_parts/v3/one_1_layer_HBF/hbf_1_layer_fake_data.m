disp('-------------------------->>> 1HBF...');
%% Create vectors to learn from
addpath('../common')
% N = 10
% D = 6
% Dp = D/2
% Dd = 4
% Np = 2
% [X, y] = generate_supervised_classification_hbf2_2_labels(N, Dp);
% disp('---> Size(X) = (D, N)');
% disp(size(X));
% disp('---> Size(y) = (N, 1)')
% disp(size(y));
%% Create vectors to learn from
%load('../common/data_3parts_3slots_divided_by_9.mat');
%load('data_3parts_3slots_divided_by_9_noise');
load('data_3parts_Dp10_3slots_divided_by_9_noise');
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
K = Dd^Np
%% Parameters
disp('Initial parameters')
lambda = 0; %reg param
c = rand(K,1)
t = rand(D,K)
% c = y(1:m:m*K)
% t = X(:,1:m:m*K)
size(c)
size(t)
%t = X(:,1:K);
mu_c = 0.08;
mu_t = 0.08;
visualize = 1;
%% intitial training error
initial_training_error = compute_Hf(X,y,c,t,lambda);
%% Learn the parameters
%prec = 0.01;
%[c_new, t_new] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, prec, visualize);
iterations = 1000;
[c, t] = learn_HBF_parameters_1_hidden_layer_iterations(X,y,c,t,lambda,mu_c,mu_t,iterations,visualize);
%% Print some results
disp('++++> Final Parameters:');
disp('c');
disp(c);
disp('t');
disp(t);
disp('Initial Training error');
disp(initial_training_error);
disp('Final Training error');
disp(compute_Hf(X,y,c,t,lambda));
[~, N] = size(X);
save('most_recent_state_of_HBF1_run')
% c
% t
% for i=1:N
%     yi = y(i)
%     xi = X(:,i)
%     fi = f_star(X(:,i),c,t)
% end