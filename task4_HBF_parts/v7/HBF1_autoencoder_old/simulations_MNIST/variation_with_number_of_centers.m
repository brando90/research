function [] = variation_with_number_of_centers( X_training_data, X_test_data, beta,lambda, k_start, k_end, step)
%
iterations_list = k_start:step:k_end;
iterations = length(iterations_list);
errors_Hf_train = zeros(iterations,1);
errors_test = zeros(iterations,1);
for K=1:iterations
    %% init
    [D, ~] = size(X_training_data);
    c_initial = zeros(K,D);
    t_initial_current = datasample(X_training_data', K, 'Replace', false)';
    mdl = HBF1(c_initial,t_initial_current,beta);
    %% train 
    current_mdl = train_LinearAlgebra(X_training_data, mdl, t_initial_current, beta);
    %% Calculate current errors
    current_Hf_train = compute_Hf_sq_error(X_training_data,X_test_data, current_mdl, lambda);
    current_Hf_test = compute_Hf_sq_error(X_training_data,X_test_data, current_mdl, lambda);
    errors_Hf_train(K) = current_Hf_train;
    errors_test(K) = current_Hf_test;
end
%% plot error progression
figure
plot(iterations_list', errors_Hf_train, '-ro', iterations_list', errors_test, '-b*');
legend('errors/risk Hfs','errors/risk Test');
title('Risk vs number of centers K -- ');
end