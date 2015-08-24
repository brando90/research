disp('-------------------------->>> 2HBF generate_all_data_list_dict ...');
%% Create vectors to learn from
load('../common/data_3parts_3slots_normalized.mat');
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
K1 = Dd * Np
K2 = Dd^Np
y
X = repmat(X,1,2);
y = repmat(y,10,2);
%% parameter initilization
%% parameters to be learned
c = rand(K2,1);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
%[ c, t1, t2 ] = expected_parameter_learning_tommys_example(Dp, Dd, Np, K1, K2)
%% SGD parameters
mu_c = 0.9;
mu_t1 = 0.9;
mu_t2 = 0.9;
prec = 0.5;
visualize = 1;
lambda = 0;
%% intitial training error
initial_training_error = compute_Hf(X,y,c,t1,t2,lambda);
%% Learn the parameters
%[c, t1, t2] = learn_HBF_parameters_2_hidden_layer(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, prec, visualize);
iterations = 500;
[c, t1, t2] = learn_HBF_parameters_2_hidden_layer_iterations(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, visualize,iterations);
%% Print some results
disp('Parameters:');
disp('c');
disp(c);
disp('t1');
disp(t1);
disp('t2');
disp(t2);
disp('Initial Training error');
disp(initial_training_error);
disp('Final Training error');
disp(compute_Hf(X,y,c,t1,t2,lambda));