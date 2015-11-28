function [ best_mdl_train ] = train_best_init_smallest_train_error(X_train,y_train, mdl2train_init_func,parameters4training)
%% train current model (choose the one with smallest training error)
error_best_mdl_train = inf;
mdl_current = mdl2train_init_func(parameters4training);
for initialization_index=1:parameters4training.num_initilizations
    %% train model
    mdl_current = mdl_current.train_iterator(X_train,y_train,initialization_index);
    error_mdl_new_train = compute_Hf_sq_error(X_train,y_train, mdl_current, mdl_current.lambda );
    if error_mdl_new_train < error_best_mdl_train
        best_mdl_train = mdl_current;
        error_best_mdl_train = error_mdl_new_train;
    end
end
end