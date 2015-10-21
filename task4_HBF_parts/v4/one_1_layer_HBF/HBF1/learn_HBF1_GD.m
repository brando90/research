function [ c, t ] = learn_HBF_parameters_1_hidden_layer_iterations(X,y, c,t,beta, mu_c,mu_t, lambda, iterations,visualize)
%learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t = (1 x 1)
%       iterations = run gradient descent for a certain number of iterations
%       visualize = whether to plot the error or not.
%   Outputs:
%       c_new = learned weights (K x 1)
%       t_new = learned centers (D x K)
[~, K] = size(t);
errors = zeros(iterations,1);
changes_c = zeros(L, iterations);
dJ_dc_mu_c_iter = zeros(L, iterations);
% changes_t = zeros(K, iterations);
for i=1:iterations
    %% get new parameters
    [c_new, dHf_dc] = update_c_batch(X,y, c,t,beta, mu_c, lambda);
    [t_new, dHf_dt] = update_t_batch(X,y, c,t,beta, mu_t, lambda);
    %% get plotting info about parameters
    % get changes for c/iter.
    change_c_wrt_current_iteration = get_dc_dt(c, c_new); % (L x 1)
    changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
    dJ_dc_col_norms = get_norms_col_dJ_dc(dJ_dc); % (L x 1)
    dJ_dc_mu_c_iter(:, i) = mu_c * dJ_dc_col_norms;
    c = c_new;
    t = t_new;
    %% get changes for t2s/iter.
    change_t_wrt_iteration = get_dt_dt(t, t_new );
    changes_t(:, i) = change_t2_wrt_iteration;
    dJ_dt_col_norms = get_norms_col_dJ_dt(dJ_dt);
    dJ_dt_mu_t_iter(:, i) = mu_t2 * dJ_dt2_col_norms;
    %% Calculate current errors
    current_error = compute_Hf(X,y, c,t,beta, lambda);
    errors(i) = current_error;
end
if visualize
    %% plot error progression
    figure
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors);
%     %% plot changes in param c
%     for k=1:K
%         c_changes_i = changes_c(k,:); % (1 x iterations)
%         %subplot(K,1,k)
%         figure
%         plot(iteration_axis,c_changes_i)
%         title(strcat('c-- ', num2str(k) ) )
%     end
%     %% plot changes in param t2
%     for k=1:K
%         t_changes_k = changes_t(k,:); % (1 x iterations)
%         figure
%         plot(iteration_axis,t_changes_k)
%         title(strcat('t-- ', num2str(k)))
%     end
% end
end
