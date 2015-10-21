disp('-------------------------->>> 1HBF...');
%% Create vectors to learn from
restoredefaultpath
addpath('./HBF1');
addpath('./HBF1/derivatives_c');
addpath('./HBF1/derivatives_t');
addpath('./HBF1/update_rules');
addpath('./HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../common/classification');
addpath('../common/softmax_risk');
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
mu_c = 0.9;
mu_t = 0.9;
lambda = 0; %reg param
%% Learn the parameters
iterations = 50
visualize = 1;
tic
mdl_initial = HBF1(c_initial,t_initial,beta);
mdl_final = learn_HBF1_GD(X_training_data,y_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;
%% Results
%% Initial Errors before learning
disp('=====> CLASSIFICATION ERRORS')
disp('-- Initial Errors before learning');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_initial )
%% Final Errors after learned model
disp('-- Final Errors after learned model');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_final )

% %% Risk
% disp('=====> RISK ERRORS')
% % intitial risk/errors
% initial_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_initial,t_initial,beta, lambda);
% initial_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_initial,t_initial,beta, lambda);
% % final risk/errors
% final_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_learned,t_learned,beta, lambda);
% final_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_learned,t_learned,beta, lambda);
% 
% disp('initial_training_empirical_risk');
% disp(initial_training_empirical_risk);
% disp('initial_test_empirical_risk');
% disp(initial_test_empirical_risk);
% disp('final_training_empirical_risk');
% disp(final_training_empirical_risk);
% disp('final_test_empirical_risk');
% disp(final_test_empirical_risk);

%% Time Elapsed
disp('--==>>iterations')
disp(iterations);
disp('--==--==> TIME');
disp('elapsed_time, seconds')
disp(elapsed_time)
disp('elapsed_time, minutes')
disp(elapsed_time/60)

%% End
beep;beep;beep;beep;beep;beep;
save('most_recent_state_of_HBF1_run')