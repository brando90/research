disp('-------------------------->>> 2HBF generate_all_data_list_dict ...');
%% Create vectors to learn from
%load('../common/data_3parts_3slots_divided_by_9_noise.mat');
%load('data_3parts_Dp10_3slots_divided_by_9_noise');
load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1')
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
K1 = Dd * Np
K2 = Dd^Np
%% parameter initilization
%% Random initilization
% c_2hbf = rand(K2,1);
% t1 = rand(Dp, Dd, Np);
% t2 = rand(K1, K2);
%% Precision = 1/standard dev.
precision_gaussian = 0.001;
%% C has true labels, t2 random, t1 parts
%t2 = rand(K1, K2);
%[ c_2hbf, t1, ~ ] = expected_good_initialization(list_dict, y, m)
%% C has true labels, t2 expected output, t1 parts
[ c_2hbf, t1, t2 ] = expected_good_initialization(list_dict, y, m)
%% SGD parameters
% mu_c = 0.001;
% mu_t1 = 0.001;
% mu_t2 = 0.001;
mu_c = 0.001;
mu_t1 = 1;
mu_t2 = 0.1;
lambda = 0;
%% intitial training error
initial_training_error = compute_Hf(X,y, c_2hbf,t1,t2,precision_gaussian, lambda);
%% Learn the parameters
%prec = 0.5;
%[c, t1, t2] = learn_HBF_parameters_2_hidden_layer(X,y,c,t1,t2,lambda,mu_c,mu_t1,mu_t2, prec, visualize);
iterations = 250;
visualize = 1;
tic
[c_2hbf, t1, t2] = learn_HBF_parameters_2_hidden_layer_iterations(X,y, c_2hbf,t1,t2,precision_gaussian, mu_c,mu_t1,mu_t2, lambda, visualize, iterations);
elapsed_time = toc;
%% Print some results
disp('Final Parameters:');
disp('c_2hbf');
disp(c_2hbf);
disp('t1');
disp(t1);
disp('t2');
disp(t2);
%% Statistical Performance
disp('Initial Training error');
disp(initial_training_error);

disp('Final Training error');
final_training_error = compute_Hf(X,y, c_2hbf,t1,t2,precision_gaussian, lambda);
disp(final_training_error);
save('most_recent_state_of_HBF2_run')

disp('Final Test Error')
load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1_TEST_DATA')
final_test_error = compute_Hf(X,y, c_2hbf,t1,t2,precision_gaussian, lambda);
disp(final_test_error);

addpath('../common');
for np=1:Np
    visualize_center_parts(t1(:,:,np));
end

disp('Initial Test error');
[ c_2hbf, t1, t2 ] = expected_good_initialization(list_dict, y, m);
initial_test_error = compute_Hf(X,y, c_2hbf,t1,t2,precision_gaussian, lambda);
disp(initial_test_error);

disp('elapsed_time')
disp(elapsed_time)