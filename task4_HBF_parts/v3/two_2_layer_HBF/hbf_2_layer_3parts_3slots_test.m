disp('-------------------------->>> 2HBF generate_all_data_list_dict ...');
%% Create vectors to learn from
%load('../common/data_3parts_3slots_divided_by_9_noise.mat');
%load('data_3parts_Dp10_3slots_divided_by_9_noise');
load('data_3parts_Dp10_3slots_divided_by_9_noise_snr_1')
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
K1 = Dd * Np
K2 = Dd^Np
%% parameter initilization
%% parameters to be learned
%c_2hbf = rand(K2,1);
%t1 = rand(Dp, Dd, Np);
%t2 = rand(K1, K2);
[ c, t1, t2 ] = expected_good_initialization(list_dict, y, m)
t2_expected = t2;
%% SGD parameters
% mu_c = 0.001;
% mu_t1 = 0.001;
% mu_t2 = 0.001;
mu_c = 0.05;
mu_t1 = 0.05;
mu_t2 = 0.05;
visualize = 1;
lambda = 0;
%% intitial training error
initial_training_error = compute_Hf(X,y,c_2hbf,t1,t2,lambda);
%% Learn the parameters
%prec = 0.5;
%[c, t1, t2] = learn_HBF_parameters_2_hidden_layer(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, prec, visualize);
iterations = 3000;
[c_2hbf, t1, t2] = learn_HBF_parameters_2_hidden_layer_iterations(X,y,c_2hbf,t1,t2,lambda,mu_c,mu_t1,mu_t2, visualize,iterations);
%% Print some results
disp('Final Parameters:');
disp('c');
disp(c_2hbf);
disp('t1');
disp(t1);
disp('t2');
disp(t2);
disp('Initial Training error');
disp(initial_training_error);
disp('Final Training error');
disp(compute_Hf(X,y,c_2hbf,t1,t2,lambda));
save('most_recent_state_of_HBF2_run')