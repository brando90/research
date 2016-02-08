disp('-------------------------->>> 1HBF...');
%% Load paths
restoredefaultpath
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/MNIST')
load('./all_MNIST_Combine')
%% Create (balanced) Data sets
%num_labels = 10;
%amount_per_label = 890;
% X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
% Y_training_labels = loadMNISTLabels('../../common/data/train-labels-idx1-ubyte');
% X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
% Y_test_labels = loadMNISTLabels('../../common/data/t10k-labels-idx1-ubyte');
X_training_data = X(:,1:35000);
Y_training_labels = Y(1:35000);
X_test_data = X(:,35001:70000);
Y_test_labels = Y(35001:70000);
%[X_training_data, ~] = get_balanced_training_set( X_training_data, Y_training_labels, amount_per_label, num_labels );
%[X_test_data, ~] = get_balanced_training_set( X_test_data, Y_test_labels, amount_per_label, num_labels );
%X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
%X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
%X_training_data = X_training_data(:,1:1000);
%% param
beta = 1;
lambda = 0;
%% Learning curve
k_start = 10;
step = 50;
k_end = 110;
iterations_list = k_start:step:k_end;
iterations = length(iterations_list);
disp(strcat('number of iterations: ', int2str(iterations) ));
disp('====---->> number of centers')
tic
variation_with_number_of_centers( X_training_data, X_test_data, beta,lambda, k_start, k_end, step)
elapsed_time = toc;
%% Time Elapsed
disp('--==--==> TIME');
disp('elapsed_time, seconds')
disp(elapsed_time)
disp('elapsed_time, minutes')
disp(elapsed_time/60)
%% End
beep;beep;beep;beep;beep;beep;
disp('---->END!!!!!!****!!!!********');