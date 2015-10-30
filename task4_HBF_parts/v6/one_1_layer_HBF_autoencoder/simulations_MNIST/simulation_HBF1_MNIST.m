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
X_training_data = zscore( X_training_data(:,1:200) );
X_training_data = X_training_data(:,1:200);
% figure
% display_network(X_training_data(:,1:12));
% display_network(X_training_data(:,13:24));
%% Parameters
[D, N] = size(X_training_data)
K = 20 % hidden units
%% parameter initilization ------------------------------------------------
%t_initial = datasample(X_training_data', K, 'Replace', false)';
t_initial = datasample(X_training_data', K, 'Replace', false)';
%t_initial = X_perfect_data;
%t_initial = X_training_data(:,[1,1002]);
%t_initial = rand(D,K);
size(t_initial)
beta = 1; % BETA
c_initial = rand(K,D);
lambda = 0; %reg param
%% GD step-size parameters
mu_c = 0.1;
mu_t = 0.3;
% mu_c = 0.00009;
% mu_t = 0.0000005;

%% Learn the parameters
disp('============++++++++++++++>>>> TRAINING STARTING');
iterations = 16 % NUMBER OF ITERATIONS!!!!
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

original_X = X_training_data(:,1:12);
[rows, cols] = size(original_X);
X_reconstruction = zeros(rows, cols);
for i=1:cols
    reconstructed_img = mdl_final.predict( original_X(:,i) );
    X_reconstruction(:,i) = reconstructed_img;
%     figure
%     display_network(X_reconstruction(:,i))
end
figure
display_network( original_X ); % Show the first 100 images
figure
display_network( X_reconstruction );

figure
display_network( nromc(original_X) ); % Show the first 100 images
figure
display_network( normc(X_reconstruction) );


% for i=1:3
%     figure
%     display_network(X_reconstruction(:,i));
% end


%% End
beep;beep;beep;beep;beep;beep;
save('most_recent_state_of_HBF1_run')
mdl = mdl_final;
disp('---->END!!!!!!****!!!!********');