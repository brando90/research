disp('-------------------------->>> 1HBF...');
%% Create vectors to learn from
addpath('.');
load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
%% Parameters 
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
K = Dd^Np
L = 2
%% parameter initilization ------------------------------------------------
%% Random initilization
% init_name = 'c_rand_t_rand';
% c_initial = rand(K,L)
% t_initial = rand(D,K)
% beta = 1;
%% Random Data points
size_subset = K
X_training_data_subset = datasample(X_training_data', size_subset, 'Replace', false);
t_initial = X_training_data_subset';
size(t_initial)
c_initial = rand(K,L);
beta = 1;
%% GD parameters
mu_c = 0.7;
mu_t = 0.7;
lambda = 0; %reg param
%% Learn the parameters
iterations = 60
visualize = 1;
tic
[c_learned,t_learned] = learn_HBF_parameters_1_hidden_layer_iterations(X_training_data,y_training_data, c_initial,t_initial,beta, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;
%% Print some results
disp('Final Parameters:');
disp('c_learned');
disp(c_learned);
disp('t_learned');
disp(t_learned);

addpath('../common/classification')
%% Initial Errors before learning
disp('=====> CLASSIFICATION ERRORS')
mdl_initial = HBF1(c_initial,t_initial,beta);
disp('-- Initial Errors before learning');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_initial )
%% Final Errors after learned model
mdl_final = HBF1(c_learned,t_learned,beta);
disp('-- Final Errors after learned model');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_final )

%% Risk
disp('=====> RISK ERRORS')
% intitial risk/errors
initial_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_initial,t_initial,beta, lambda);
initial_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_initial,t_initial,beta, lambda);
% final risk/errors
final_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_learned,t_learned,beta, lambda);
final_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_learned,t_learned,beta, lambda);

disp('initial_training_empirical_risk');
disp(initial_training_empirical_risk);
disp('initial_test_empirical_risk');
disp(initial_test_empirical_risk);
disp('final_training_empirical_risk');
disp(final_training_empirical_risk);
disp('final_test_empirical_risk');
disp(final_test_empirical_risk);

save('most_recent_state_of_HBF1_run')

%% Time Elapsed
disp('--==>>iterations = 53')
iterations
disp('--==--==> TIME');
disp('elapsed_time, seconds')
disp(elapsed_time)
disp('elapsed_time, minutes')
disp(elapsed_time/60)
%%

% addpath('../common');
% num = 3;
% for np=1:Np
%     i_start = (np-1)*num+1;
%     i_end = np*num-1;
%     t_set = t_learned(:, i_start : i_end);
%     visualize_center_parts( t_set );
% end

% fileID = fopen(strcat(strcat('statistical_performance_', init_name) ,'.txt'), 'w');
% fprintf(fileID, 'Simulation: %12s \n', init_name);
% fprintf(fileID, 'Ocurred: %12s \n', datestr(clock, 0));
% fprintf(fileID, 'initial_training_error: %6.2f \n', initial_training_errorinitial_training_empirical_risk);
% fprintf(fileID, 'final_training_error: %6.2f \n', final_training_error);
% fprintf(fileID, 'initial_test_error: %6.2f \n', initial_test_error);
% fprintf(fileID, 'final_test_error: %6.2f \n', final_test_error);
% fprintf(fileID, '----- \n');
% fprintf(fileID, 'iterations %6.2f \n', iterations );
% fprintf(fileID, 'elapsed_time %6.2f \n', elapsed_time );
% fclose(fileID);
beep;
beep;