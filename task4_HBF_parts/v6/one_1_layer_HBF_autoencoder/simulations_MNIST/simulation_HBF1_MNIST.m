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

X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
%X_training_data = zscore( X_training_data(:,1:200) );
X_training_data = X_training_data(:,1:1000);
% figure
% display_network(X_training_data);
%display_network(X_training_data(:,1:12));
% display_network(X_training_data(:,13:24));
%% Parameters
[D, N] = size(X_training_data)
K = 100 % hidden units
%% parameter initilization ------------------------------------------------
one_letter_of_each = X_training_data(:,[1:6,8,14,16,18]);
t_initial = [one_letter_of_each, datasample(X_training_data', K-10, 'Replace', false)' ];
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
mu_c = 0.1;
mu_t = 0.001;
% mu_c = 0.00009;
% mu_t = 0.0000005;

%% Learn the parameters
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 10 % NUMBER OF ITERATIONS!!!!
visualize = 1;
mdl_initial = HBF1(c_initial,t_initial,beta);
tic
mdl_final = learn_HBF1_batch_GD(X_training_data,X_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
%mdl_final = learn_HBF1_alternating_minimization(X_training_data,y_training_data, mdl_initial, mu_c,mu_t, lambda, iterations,visualize);
elapsed_time = toc;

%%
error_training_initial_model = compute_Hf_sq_error(X_training_data,X_training_data, mdl_initial, lambda)
%error_test_initial_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_initial, lambda)

error_training_final_model = compute_Hf_sq_error(X_training_data,X_training_data, mdl_final, lambda)
%error_test_final_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_final, lambda)

%% Time Elapsed
disp('--==>>iterations')
disp(iterations);
disp('--==--==> TIME');
disp('elapsed_time, seconds')
disp(elapsed_time)
disp('elapsed_time, minutes')
disp(elapsed_time/60)

%% Visualize data TRAIN
originalTrainingX = X_training_data(:,1:30);
[rows_train, cols_train] = size(originalTrainingX);
reconstructionTrainingX = zeros(rows_train, cols_train);
for i=1:cols_train
    reconstructed_img = mdl_final.predict( originalTrainingX(:,i) );
    reconstructionTrainingX(:,i) = reconstructed_img;
end
%% visualize original_training_X
%original
figure
display_network( originalTrainingX );
title('originalTrainingX')
figure
display_network( reconstructionTrainingX );
title('reconstructionTrainingX')
%normalized
figure
display_network( normc(originalTrainingX) );
title('normc(originalTrainingX) NORMALIZED')
figure
display_network( normc(reconstructionTrainingX) );
title('normc(reconstructionTrainingX) NORMALIZED')
%% visualize centers
%original
figure;
display_network( mdl_final.t );
title('learned centers: mdl final.t')
%normalized
figure;
display_network( normc(mdl_final.t) );
title('learned centers normalized: normc(mdl_final.t)')
%original
figure;
display_network( t_initial );
title('initial centers: t initial')
%normalized
figure;
display_network( normc(t_initial) );
title('initial centers normalized: normc(t initial)')

%% Visualize data TEST
originalTestX = X_test_data(:,1:30);
[rows_test, cols_test] = size(originalTestX);
reconstructionTestX = zeros(rows_test, cols_test);
for i=1:cols_test
    reconstructed_img = mdl_final.predict( originalTestX(:,i) );
    reconstructionTestX(:,i) = reconstructed_img;
end
%% visualize original_training_X
%original
figure
display_network( originalTestX );
title('originalTestX')
figure
display_network( reconstructionTestX );
title('reconstructionTestX')
%normalized
figure
display_network( normc(originalTestX) );
title('normc(originalTestX) NORMALIZED')
figure
display_network( normc(reconstructionTestX) );
title('normc(reconstructionTestX) NORMALIZED')

%% End
beep;beep;beep;beep;beep;beep;
save('most_recent_state_of_HBF1_run')
mdl = mdl_final;
disp('---->END!!!!!!****!!!!********');