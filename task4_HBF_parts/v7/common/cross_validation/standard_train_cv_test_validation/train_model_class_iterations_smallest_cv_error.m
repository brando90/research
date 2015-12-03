function [ best_mdl_train ] = train_model_class_iterations_smallest_cv_error(X_train,y_train,X_cv,y_cv, params4mdl_iter)
%   train current model (choose the one with smallest error on the given data set)
%       when all the data is X_train, it chooses the hypothesis with the
%       smallest train error (simulating choosing the closest to the global
%       minimum as best as it can)
%       when there is CV and train data, it chooses the model with best cv
%       error amongst the trained models.
%   Input:
%       X_train
%       y_train
%       X_cv
%       y_cv
%       params4mdl_iter
error_best_mdl_train = inf;
num_inits = params4mdl_iter.num_inits;
for initialization_index=1:num_inits
    %% train model on the current iteration
    mdl_current = params4mdl_iter.train_iterator(X_train,y_train);
    error_mdl_new_train = compute_Hf_sq_error(X_cv,y_cv, mdl_current, mdl_current.lambda );
    if error_mdl_new_train < error_best_mdl_train
        best_mdl_train = mdl_current;
        error_best_mdl_train = error_mdl_new_train;
    end
end
end