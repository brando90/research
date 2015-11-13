disp('-------------------------->>> 1HBF...');
%% Load paths
restoredefaultpath
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/classification');
addpath('../../common/softmax_risk');
load('../../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
X_training_data = normc(X_training_data);
X_test_data = normc(X_test_data);
%% Parameters
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
%K = Dd^Np
K = 7
L = 2
%% parameter initilization ------------------------------------------------
%% Random initilization
% c_initial = rand(K,L);
% t_initial = rand(D,K);
% beta = 1;
%% Random Data points
%t_initial = datasample(X_training_data', K, 'Replace', false)';
t_initial = [datasample(X_training_data', K-2, 'Replace', false)', X_perfect_data];
%t_initial = X_perfect_data;
%t_initial = X_training_data(:,[1,1002]);
size(t_initial)
c_initial = rand(K,L);
beta = 1;
%% GD parameters
mu_c = 0.0001;
mu_t = 0.001;
lambda = 0; %reg param
%% Learn the parameters
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 5*20
visualize = 1;
mdl_initial = HBF1(c_initial,t_initial,beta);
tic
mdl_final = learn_HBF1_batch_GD(X_training_data,y_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
%mdl_final = learn_HBF1_alternating_minimization(X_training_data,y_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;
%% Results
%% Initial Classification Errors before learning
disp('=====> CLASSIFICATION ERRORS')
disp('-- Initial Classification Errors before learning');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_initial )
%% Final Errors after learned model
disp('-- Final Classification Errors after learned model');
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
