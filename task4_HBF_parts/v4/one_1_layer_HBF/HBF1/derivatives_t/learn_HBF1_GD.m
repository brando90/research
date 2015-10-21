function [ mdl_final ] = learn_HBF1_GD(X,y, mdl, mu_c,mu_t, lambda, iterations,visualize)
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
[~, K] = size(mdl.t);
[~, L] = size(mdl.c);
errors = zeros(iterations,1);
changes_c = zeros(L, iterations);
dHf_dc_mu_c_iterion = zeros(L, iterations);
changes_t = zeros(K, iterations);
dHf_dt_mu_t_iter = zeros(K, iterations);
mdl_final = HBF1(mdl.c, mdl.t, mdl.beta);
for i=1:iterations
    %% get new parameters
    [c_new, dHf_dc] = update_c_batch(X,y, mdl, mu_c, lambda);
    [t_new, dHf_dt] = update_t_batch(X,y, mdl, mu_t, lambda);
    %% get changes for c/iter.
    change_c_wrt_current_iteration = get_dc_diter(mdl.c, c_new); % (L x 1)
    changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
    dJ_dc_col_norms = get_norms_col_dHf_dc(dHf_dc); % (L x 1)
    dHf_dc_mu_c_iterion(:, i) = mu_c * dJ_dc_col_norms;
    %% get changes for t2s/iter.
    change_t_wrt_iteration = get_dt_diter(mdl.t, t_new );
    changes_t(:, i) = change_t_wrt_iteration;
    dHf_diter_col_norms = get_norms_col_dHf_dt(dHf_dt);
    dHf_dt_mu_t_iter(:, i) = mu_t * dHf_diter_col_norms;
    %% update HBF1 model
    mdl_final.c = c_new;
    mdl_final.t = t_new;
    %% Calculate current errors
    current_error = compute_Hf(X,y, mdl, lambda);
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
