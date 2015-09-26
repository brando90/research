disp('-------------------------->>> SCRIPT: 2HBF generate_all_data_list_dict ...');
%% Create vectors to learn from
%load('../common/data_3parts_3slots_divided_by_9_noise.mat');
%load('data_3parts_Dp10_3slots_divided_by_9_noise');
load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1')
%% Parameters 
% repetitions = 2;
[Dp, Dd, Np] = size(list_dict)
K1 = Dd * Np
K2 = Dd^Np
L = K2
%% parameter initilization ------------------------------------------------
%% Random initilization
init_name = 'c_rand_t2_rand_t1_rand';
c_2hbf_initial = rand(K2,L);
t1_initial = rand(Dp, Dd, Np);
t2_initial = rand(K1, K2);
%% C has true labels, t2 random, t1 parts
% init_name = 'c_labels_t2_rand_t1_parts';
% t2_initial = rand(K1, K2);
% [ c_2hbf_initial, t1_initial, ~ ] = expected_good_initialization(list_dict, y, m)
%% C has true labels, t2 expected output, t1 parts
%init_name = 'c_labels_t2_expected_t1_parts';
%[ c_2hbf_initial, t1_initial, t2_initial ] = expected_good_initialization(list_dict, y, m_train)
%% Precision = 1/standard dev. --------------------------------------------
precision_gaussian = 0.001;
%% SGD parameters
mu_c = 0.9;
mu_t1 = 0.9;
mu_t2 = 0.9;
lambda = 0;
%% Learn the parameters
iterations = 50;
visualize = 1;
disp('============++++++++++++++>>>> TRAINING STARTING');
tic
[c_2hbf_learned,t1_learned,t2_learned] = learn_HBF_parameters_2_hidden_layer_iterations(X_training_data,y_training_data, c_2hbf_initial,t1_initial,t2_initial,precision_gaussian, mu_c,mu_t1,mu_t2, lambda, visualize, iterations);
elapsed_time = toc;
%% Print some results
disp('Final Parameters:');
disp('c_2hbf');
disp(c_2hbf_initial);
disp('t1');
disp(t1_initial);
disp('t2');
disp(t2_initial);
%% Data sizes:
disp(N_size_training_data);
disp(N_size_test_data);
%% intitial risk/errors
initial_training_error = compute_Hf(X_training_data,y_training_data, c_2hbf_initial,t1_initial,t2_initial,precision_gaussian, lambda);
initial_test_error = compute_Hf(X_test_data,y_test_data, c_2hbf_initial,t1_initial,t2_initial,precision_gaussian, lambda);
%% final risk/errors
final_training_error = compute_Hf(X_training_data,y_training_data, c_2hbf_learned,t1_learned,t2_learned,precision_gaussian, lambda);
final_test_error = compute_Hf(X_test_data,y_test_data, c_2hbf_learned,t1_learned,t2_learned,precision_gaussian, lambda);
%% Print Errors
disp('initial_training_error');
disp(initial_training_error);
disp('final_training_error');
disp(final_training_error);
disp('initial_test_error');
disp(initial_test_error);
disp('final_test_error');
disp(final_test_error);

% addpath('../common');
% for np=1:Np
%     visualize_center_parts(t1(:,:,np));
% end

disp('elapsed_time')
disp(elapsed_time)

fileID = fopen(strcat(strcat('statistical_performance_', init_name) ,'.txt'), 'w');
fprintf(fileID, 'Simulation: %12s \n', init_name);
fprintf(fileID, 'Ocurred: %12s \n', datestr(clock, 0));
fprintf(fileID, 'initial_training_error: %6.2f \n', initial_training_error);
fprintf(fileID, 'final_training_error: %6.2f \n', final_training_error);
fprintf(fileID, 'initial_test_error: %6.2f \n', initial_test_error);
fprintf(fileID, 'final_test_error: %6.2f \n', final_test_error);
fprintf(fileID, '----- \n');
fprintf(fileID, 'iterations %6.2f \n', iterations );
fprintf(fileID, 'elapsed_time %6.2f \n', elapsed_time );
fprintf(fileID, 'N_size_training_data: %12s', N_size_training_data);
fprintf(fileID, 'N_size_test_data %12s', N_size_test_data);
fclose(fileID);