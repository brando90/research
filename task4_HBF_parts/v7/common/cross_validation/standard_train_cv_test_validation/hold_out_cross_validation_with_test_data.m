function [ best_mdl, error_best_mdl] = hold_out_cross_validation_with_test_data(data_for_cross_validation, betas, params4mdl_iter, visualize)
%   Input:
%   Output:
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data_for_cross_validation.get_data_for_hold_out_cross_validation();
%% arrays to be plotted
iterations = length(betas);
list_train_errors = zeros(1,iterations);
list_test_errors = zeros(1,iterations);
%% hold-out cross validation
lambda = 0; % TODO
error_best_mdl = inf;
for i=1:iterations
    current_beta = betas(i);
    %% train current model (choose the one with smallest training error)
    params4mdl_iter.beta = current_beta;
    params4mdl_iter.current_training_iteration = 1;
    current_trained_mdl = train_model_class_test_iterations_smallest_error(X_train,y_train,X_cv,y_cv, params4mdl_iter);
    %% record the trained models error
    if visualize
        list_train_errors(i) = compute_Hf_sq_error( X_train,y_train, current_trained_mdl, lambda );
        list_test_errors(i) = compute_Hf_sq_error( X_test,y_test, current_trained_mdl, lambda );
    end
    %% get best cv model
    error_current_trained_mdl = compute_Hf_sq_error( X_cv,y_cv, current_trained_mdl, lambda );
    if error_current_trained_mdl < error_best_mdl
        best_mdl_cv = current_trained_mdl;
        error_best_mdl = error_current_trained_mdl;
    end
end
error_best_mdl = compute_Hf_sq_error( X_test,y_test, best_mdl_cv, lambda );
best_mdl = best_mdl_cv;
if visualize
    figure
    plot(betas, list_train_errors, '-ro', betas, list_test_errors, '-b*');
    legend('list train errors','list test errors');
    title('Cost vs Beta');   
end
end