disp('-------------------------->>> 1HBF...');
%% Create vectors to learn from
%% Create vectors to learn from
%load('../common/data_3parts_3slots_divided_by_9.mat');
%load('data_3parts_3slots_divided_by_9_noise');
%load('data_3parts_Dp10_3slots_divided_by_9_noise');
load('data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
%% Parameters 
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
K = Dd^Np
%% parameter initilization ------------------------------------------------
%% Random initilization
init_name = 'c_rand_t_rand';
c_initial = rand(K,1)
t_initial = rand(D,K)
%% C has data labels, t has x points
% init_name = 'c_data_t_data';
% c_initial = y_training_data(1:m_train:m_train*K)
% t_initial = X_training_data(:,1:m_train:m_train*K)
%% GD parameters
mu_c = 300;
mu_t = 300;
lambda = 0; %reg param
%% Learn the parameters
iterations = 100
visualize = 1;
tic
[c_learned,t_learned] = learn_HBF_parameters_1_hidden_layer_iterations(X_training_data,y_training_data, c_initial,t_initial, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;
%% Print some results
disp('Final Parameters:');
disp('c_learned');
disp(c_learned);
disp('t_learned');
disp(t_learned);
%% intitial risk/errors
initial_training_error = compute_Hf(X_training_data,y_training_data, c_initial,t_initial, lambda);
initial_test_error = compute_Hf(X_test_data,y_test_data, c_initial,t_initial, lambda);
%% final risk/errors
final_training_error = compute_Hf(X_training_data,y_training_data, c_learned,t_learned, lambda);
final_test_error = compute_Hf(X_test_data,y_test_data, c_learned,t_learned, lambda);
%% Print Errors
disp('initial_training_error');
disp(initial_training_error);
disp('final_training_error');
disp(final_training_error);
disp('initial_test_error');
disp(initial_test_error);
disp('final_test_error');
disp(final_test_error);

save('most_recent_state_of_HBF1_run')

disp('elapsed_time')
disp(elapsed_time)

addpath('../common');
num = 3;
for np=1:Np
    i_start = (np-1)*num+1;
    i_end = np*num-1;
    t_set = t_learned(:, i_start : i_end);
    visualize_center_parts( t_set );
end

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
fclose(fileID);