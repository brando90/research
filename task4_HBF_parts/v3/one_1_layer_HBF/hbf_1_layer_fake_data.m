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
load('../common/data_3parts_3slots_divided_by_9.mat');
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
K = Dd^Np
y
X
size(X)
size(y)
X = repmat(X,1,10);
y = repmat(y,10,1);
size(X)
size(y)
%% Parameters
lambda = 0; %reg param
% c = rand(K,1)
% t = rand(D,K)
c = y(1:K)
t = X(:,1:K)
%t = X(:,1:K);
mu_c = 0.9;
mu_t = 0.9;
visualize = 1;
%% intitial training error
initial_training_error = compute_Hf(X,y,c,t,lambda);
f = f_star(X(:,3),c,t)
y(3)
%% Learn the parameters
%prec = 0.01;
%[c_new, t_new] = learn_HBF_parameters_1_hidden_layer(X, y, c, t, lambda, mu_c, mu_t, prec, visualize);

iterations = 10;
[c, t] = learn_HBF_parameters_1_hidden_layer_iterations(X,y,c,t,lambda,mu_c,mu_t,iterations,visualize);
%% Print some results
disp('Parameters:');
disp('c');
disp(c);
disp('t');
disp(t);
disp('Initial Training error');
disp(initial_training_error);
disp('Final Training error');
disp(compute_Hf(X,y,c,t,lambda));
[~, N] = size(X);
% c
% t
% for i=1:N
%     yi = y(i)
%     xi = X(:,i)
%     fi = f_star(X(:,i),c,t)
% end