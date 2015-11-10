function [] = learning_curves( X_training_data, X_test_data, N_current, step_size_data_set )
%
lambda = 0; %TODO
N_data_sizes = zeros(iterations,1);
errors_Hfs = zeros(iterations,1);
errors_Test = zeros(iterations,1);
for i=1:iterations
    N_data_sizes(i) = N_current;
    %% get current train data
    X_train_data_current = X_training_data(:,1:N_current);
    X_test_data_current = X_test_data(:,1:N_current);
    %% init
    %t_initial = datasample(X_training_data', K, 'Replace', false)';
    t_initial = X_training_data(:,[1:6,8,14,16,18]);
    c_initial = zeros(size(c_initial));
    mdl = HBF1( c_initial, t_initial,beta);
    %% train 
    current_mdl = train_LinearAlgebra(Xtrain, mdl, t_initial);
    %% Calculate current errors
    current_Hf = compute_Hf_sq_error(X_train_data_current,X_train_data_current, current_mdl, lambda);
    current_Hf_test = compute_Hf_sq_error(X_test_data_current,X_test_data_current, current_mdl, lambda);
    errors_Hfs(i) = current_Hf;
    errors_Test(i) = current_Hf_test;
    %%
    N_current = N_current + step_size_data_set;
end
%% plot error progression
figure
iteration_axis = 1:iterations;
plot(iteration_axis, errors_Hfs);
title('Error Hf over iteration -- ');
%% plot test error progression
figure
iteration_axis = 1:iterations;
plot(iteration_axis, errors_Test);
title('TEST error over iteration -- ');
end