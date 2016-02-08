disp('-------------------------->>> 2HBF...');
%% Load paths
restoredefaultpath
addpath('../HBF2');
addpath('../HBF2/model_functions');
addpath('../HBF2/derivatives_c');
addpath('../HBF2/derivatives_t1');
addpath('../HBF2/derivatives_t2');
addpath('../HBF2/update_rules_GD/stochastic_gradient_descent');
addpath('../HBF2/analytic_tools_analysis_HBF2_GD');
addpath('../../common/classification');
addpath('../../common/softmax_risk');
load('../../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
%% Parameters 
[Dp, Dd, Np] = size(list_dict)
%Dd = 10
K1 = Dd * Np % Dd * Np good?
Dd_to_pwr_Np = Dd^Np
K2 = 20 % Dd^Np good
L = 2 % L = K2 good?
%% Param initilization ------------------------------------------------
%% Random initilization
c_2hbf_initial = rand(K2,L);

t_initial = initialization_from_data_t1( X_training_data, Dp,Dd,Np);

t2_initial = rand(K1, K2);
beta = 1;
%% SGD parameters
mu_c = 1.2;
mu_t1 = 12;
mu_t2 = 0.9;
lambda = 0;
%% Learn the parameters
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 100;
visualize = 1;
tic
mdl_initial = HBF2(c_2hbf_initial,t1_initial,t2_initial,beta);
mdl_final = learn_HBF2_stochastic(X_training_data,y_training_data, mdl_initial, mu_c,mu_t1,mu_t2, lambda, visualize, iterations);
elapsed_time = toc;
%% Results
%% Initial Errors before learning
disp('=====> CLASSIFICATION ERRORS')
disp('-- Initial Classification Errors before learning');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_initial )
%% Final Errors after learned model
disp('-- Final Classification Errors after learned model');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_final )

% disp('c');
% mdl_initial.c
% mdl_final.c
% disp('t1');
% mdl_initial.t1
% mdl_final.t1
% disp('t2');
% mdl_initial.t2
% mdl_final.t2

%% Risk
% % intitial risk/errors
% initial_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_2hbf_initial,t1_initial,t2_initial,precision_gaussian, lambda);
% initial_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_2hbf_initial,t1_initial,t2_initial,precision_gaussian, lambda);
% % final risk/errors
% final_training_empirical_risk = compute_Hf(X_training_data,y_training_data, c_2hbf_learned,t1_learned,t2_learned,precision_gaussian, lambda);
% final_test_empirical_risk = compute_Hf(X_test_data,y_test_data, c_2hbf_learned,t1_learned,t2_learned,precision_gaussian, lambda);
% % Print Empirical Risks
% disp('initial_training_empirical_risk');
% disp(initial_training_empirical_risk);
% disp('initial_test_empirical_risk');
% disp(initial_test_empirical_risk);
% disp('final_training_empirical_risk');
% disp(final_training_empirical_risk);
% disp('final_test_empirical_risk');
% disp(final_test_empirical_risk);

% addpath('../common');
% for np=1:Np
%     visualize_center_parts(t1(:,:,np));
% end

%% Time Elapsed
disp('--==>>iterations')
disp(iterations);
disp('--==--==> TIME');
disp('elapsed_time, seconds')
disp(elapsed_time)
disp('elapsed_time, minutes')
disp(elapsed_time/60)

beep;beep;beep;beep;beep;beep;
save('most_recent_state_of_HBF2_run')