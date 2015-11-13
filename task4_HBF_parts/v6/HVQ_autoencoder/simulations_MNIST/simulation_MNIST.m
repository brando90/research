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
addpath('../../common/MNIST')

num_labels = 10;
amount_per_label = 100;

X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
Y_training_labels = loadMNISTLabels('../../common/data/train-labels-idx1-ubyte');

X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
Y_test_labels = loadMNISTLabels('../../common/data/t10k-labels-idx1-ubyte');

[X_training_data, ~] = get_balanced_training_set( X_training_data, Y_training_labels, amount_per_label, num_labels );
[X_test_data, ~] = get_balanced_training_set( X_test_data, Y_test_labels, amount_per_label, num_labels );

%% Parameters
Np = 4
Dd = 3
K1 = Dd * Np
K2 = 20 % Dd^Np largest
L = 10 %
%% Param initilization ------------------------------------------------
%% Random initilization
c_2hbf_initial = rand(K2,L);
t1_initial = init_t1_from_data( X_training_data, Dd,Np);
t2_initial = rand(K1, K2);
beta = 1;
%% SGD parameters
mu_c = 1.2;
mu_t1 = 12;
mu_t2 = 0.9;
lambda = 0;
%% Learn the parameters
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 10;
visualize = 1;
tic
mdl_initial = HBF2(c_2hbf_initial,t1_initial,t2_initial,beta);
mdl_final = learn_HBF2_stochastic(X_training_data,Y_training_labels, mdl_initial, mu_c,mu_t1,mu_t2, lambda, visualize, iterations);
elapsed_time = toc;
%% Results
%% Initial Errors before learning
disp('=====> CLASSIFICATION ERRORS')
disp('-- Initial Classification Errors before learning');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_initial )
%% Final Errors after learned model
disp('-- Final Classification Errors after learned model');
print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl_final )

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