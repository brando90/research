function [ best_mdl_train ] = train_best_init_smallest_train_error(train_func, X_train,y_train, current_beta, c_initilizations,t_initilizations, gd_iterations)
%% train current model (choose the one with smallest training error)
error_best_mdl_train = inf;
[~, ~, num_initilizations] = size(c_initilizations);
lambda = 0; % TODO
for i=1:num_initilizations
    %% current initialize
    c_init = c_initilizations(:,:,i);
    t_init = t_initilizations(:,:,i);
    %% initialize model
    mdl_current = RBF(c_init, t_init, current_beta);
    mdl_current.iterations = gd_iterations;
    %% train model
    mdl_current = mdl_current.train(X_train,y_train, train_func);
    error_mdl_new_train = compute_Hf_sq_error( X_train,y_train, mdl_current, lambda );
    if error_mdl_new_train < error_best_mdl_train
        best_mdl_train = mdl_current;
        error_best_mdl_train = compute_Hf_sq_error( X_train,y_train, best_mdl_train, lambda );
    end
end
end