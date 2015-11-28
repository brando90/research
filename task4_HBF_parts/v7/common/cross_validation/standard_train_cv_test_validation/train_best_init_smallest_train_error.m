function [ best_mdl_train ] = train_best_init_smallest_train_error(X_train,y_train, params4mdl_iter)
%% train current model (choose the one with smallest training error)
error_best_mdl_train = inf;
num_initilizations = params4mdl_iter.num_initilizations;
for initialization_index=1:num_initilizations
    %% train model
    mdl_current = params4mdl_iter.train_iterator(X_train,y_train);
    error_mdl_new_train = compute_Hf_sq_error(X_train,y_train, mdl_current, mdl_current.lambda );
    if error_mdl_new_train < error_best_mdl_train
        best_mdl_train = mdl_current;
        error_best_mdl_train = error_mdl_new_train;
    end
end
end