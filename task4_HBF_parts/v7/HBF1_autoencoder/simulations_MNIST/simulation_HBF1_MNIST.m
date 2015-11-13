disp('-------------------------->>> 1HBF...');
%% Load paths
restoredefaultpath
clear
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/MNIST')
%load('./all_MNIST_Combine')

%% Create (balanced) Data sets
num_labels = 10;
amount_per_label = 100;

% X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
% Y_training_labels = loadMNISTLabels('../../common/data/train-labels-idx1-ubyte');
% 
% X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
% Y_test_labels = loadMNISTLabels('../../common/data/t10k-labels-idx1-ubyte');

[X_training_data, ~] = get_balanced_training_set( X_training_data, Y_training_labels, amount_per_label, num_labels );
[X_test_data, ~] = get_balanced_training_set( X_test_data, Y_test_labels, amount_per_label, num_labels );

%X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
X_test_data = X_test_data(:,:);
X_training_data = X_training_data(:,:);
%% Parameters
[D, N] = size(X_training_data)
K = 10 % hidden units
%% parameter initilization ------------------------------------------------
one_letter_of_each = X_training_data(:,[1:6,8,14,16,18]);
t_initial = one_letter_of_each;
%t_initial = [one_letter_of_each, datasample(X_training_data', K-10, 'Replace', false)' ];
%t_initial = datasample(X_training_data', K, 'Replace', false)';
%t_initial = X_perfect_data;
%t_initial = X_training_data(:,[1,1002]);
%t_initial = rand(D,K);
size(t_initial)
beta = 1; % BETA
c_initial = normc(rand(K,D));
%c_initial = rand(K,D);
lambda = 0; %reg param
%% GD step-size parameters
mu_c = 0.01;
mu_t = 0.01;

%% Learn parameters GD
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 40 % NUMBER OF ITERATIONS!!!!
visualize = 1;
mdl_initial = HBF1(c_initial,t_initial,beta);
tic
% mdl_final_GD = learn_HBF1_batch_GD(X_training_data,X_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize, X_test_data,X_test_data);
% mdl_final = learn_HBF1_alternating_minimization(X_training_data,y_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;

%% Learn parameters Linear Algebra (LA)
mdl_final_LA = HBF1( zeros(size(c_initial)) ,t_initial,beta);
% Kern_matrix = produce_kernel_matrix(X_training_data, t_initial, beta);
% C = pinv(Kern_matrix) * X_training_data';
mdl_final_LA = train_LinearAlgebra( X_training_data, mdl_final_LA, t_initial,beta)

%% Error of model 
test_initial = 'initial';
text_GD = ' Gradient Descent';
text_LA = ' Linear Algebra';

disp(test_initial);
error_training_initial_model = compute_Hf_sq_error(X_training_data,X_training_data, mdl_initial, lambda)
error_test_initial_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_initial, lambda)

% disp(text_GD);
% error_training_final_model = compute_Hf_sq_error(X_training_data,X_training_data, mdl_final_GD, lambda)
% error_test_final_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_final_GD, lambda)

disp(text_LA);
error_training_final_model_LA = compute_Hf_sq_error(X_training_data,X_training_data, mdl_final_LA, lambda)
error_test_final_model_LA = compute_Hf_sq_error(X_test_data,X_test_data, mdl_final_LA, lambda)

%% Visualize data TRAIN
% print_reconstructions( mdl_final_GD, X_training_data, X_test_data, text_GD );
print_reconstructions( mdl_final_LA, X_training_data, X_test_data, text_LA)

%% visualize centers
%original
% figure;
% display_network( mdl_final_GD.t );
% title('learned centers: mdl final GD.t')
% colorbar
%normalized
% figure;
% display_network( normc(mdl_final_GD.t) );
% title('learned centers normalized: normc(mdl final GD.t)')
% colorbar
%original
figure;
display_network( t_initial );
title('initial centers: t initial')
colorbar
% %normalized
% figure;
% display_network( normc(t_initial) );
% title('initial centers normalized: normc(t initial)')

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
disp('---->END!!!!!!****!!!!********');