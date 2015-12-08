function [] = learning_curves( X_training_data, X_test_data, K,beta, N_start, N_end, step_size_data_set )
%
lambda = 0; %TODO
iterations = floor((N_end - N_start)/step_size_data_set);
disp('iterations: ')
disp(iterations)
if N_end - N_start < 0 || iterations <= 0
    disp('iterations');
    disp(iterations);
    disp('N_start');
    disp(N_start);
    disp('N_end');
    disp(N_end);
    disp('ERROR, check your bounds on how you want to get your learning curves');
    keyboard
end
N_data_sizes = zeros(iterations,1);
errors_Hf_train = zeros(iterations,1);
errors_test = zeros(iterations,1);
N_current = N_start;
%t_initial_current = datasample(X_training_data', K, 'Replace', false)';
for i=1:iterations
    N_data_sizes(i) = N_current;
    %% get current train data
    X_train_data_current = X_training_data(:,1:N_current);
    X_test_data_current = X_test_data(:,1:N_current);
    %% init
    [D, ~] = size(X_training_data);
    c_initial = zeros(K,D);
    %t_initial_current = datasample(X_training_data', K, 'Replace', false)';
    t_initial_current = X_training_data(:,[1:6,8,14,16,18]);
    mdl = HBF1(c_initial,t_initial_current,beta);
    %% train 
    current_mdl = train_LinearAlgebra(X_train_data_current, mdl, t_initial_current, beta);
    %% Calculate current errors
    current_Hf_train = compute_Hf_sq_error(X_train_data_current,X_train_data_current, current_mdl, lambda);
    current_Hf_test = compute_Hf_sq_error(X_test_data_current,X_test_data_current, current_mdl, lambda);
    errors_Hf_train(i) = current_Hf_train;
    errors_test(i) = current_Hf_test;
    %%
    N_current = N_current + step_size_data_set;
end
%% plot error progression
figure
plot(N_data_sizes, errors_Hf_train, '-ro', N_data_sizes, errors_test, '-b*');
legend('errors Hfs','errors Test');
title('Risk vs data size -- ');
end