function [ c, t ] = learn_HBF_parameters_1_hidden_layer_iterations(X,y, c,t,beta, mu_c,mu_t, lambda, iterations,visualize)
%learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K x 1)
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
% changes_c = zeros(K, iterations);
% changes_t = zeros(K, iterations);
for i=1:iterations
    %% get new parameters
    c_new = update_c_batch(X,y, c,t,beta, mu_c, lambda);
    t_new = update_t_batch(X,y, c,t,beta, mu_t, lambda);
%     %% get changes for c/iteration
%     change_c_wrt_iteration = c_new - c;
%     changes_c(:, i) = change_c_wrt_iteration;
%     %% get changes for t/iteration
%     change_t_wrt_iteration = get_dt_dt(t, t_new );
%     changes_t(:, i) = change_t_wrt_iteration; 
    %% update params
    c = c_new;
    t = t_new;
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