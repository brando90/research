function [ best_mdl, error_best_mdl] = split_cross_validation(mdl, X,y, per_train,per_cv, betas, train_func,num_initilizations,visualize)
%   Input:
%       mdl = model
lambda = mdl.lambda; % TODO
[~, N] = size(X);
N_train = floor(N * per_train);
N_cv = floor(N * per_cv);
%N_test = N - N_train - N_cv;
X_train = X(:,1:N_train);
X_cv = X(:, N_train+1:N_train+N_cv );
X_test = X(:, N_train+N_cv+1:N);
y_train = y(:,1:N_train);
y_cv = y(:, N_train+1:N_train+N_cv );
y_test = y(:, N_train+N_cv+1:N);
best_mdl_cv = mdl;
iterations = length(betas);
list_train_errors = zeros(1,iterations);
list_test_errors = zeros(1,iterations);
error_best_mdl_cv = compute_Hf_sq_error( X_cv,y_cv, best_mdl_cv, lambda );
for i=1:iterations
    current_beta = betas(i);
    mdl.beta = current_beta;
    %% train current model (choose the one with smallest training error)
    best_mdl_train = mdl;
    error_best_mdl_train = compute_Hf_sq_error( X_train,y_train, best_mdl_train, lambda );
    for ii=1:num_initilizations
        mdl_new = mdl.train(X_train,y_train, train_func);
        error_mdl_new_train = compute_Hf_sq_error( X_train,y_train, mdl_new, lambda );
        if error_mdl_new_train < error_best_mdl_train
            best_mdl_train = mdl_new;
            error_best_mdl_train = compute_Hf_sq_error( X_train,y_train, best_mdl_train, lambda );
        end
    end
    %% record the trained models error
    list_train_errors(i) = compute_Hf_sq_error( X_train,y_train, best_mdl_train, lambda );
    list_test_errors(i) = compute_Hf_sq_error( X_test,y_test, best_mdl_train, lambda );
    %% best cv model
    error_trained_mdl_cv = compute_Hf_sq_error( X_cv,y_cv, best_mdl_train, lambda );
    if error_trained_mdl_cv < error_best_mdl_cv
        best_mdl_cv = mdl_new;
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