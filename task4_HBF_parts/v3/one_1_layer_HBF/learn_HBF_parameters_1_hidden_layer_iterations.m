function [ c, t ] = learn_HBF_parameters_1_hidden_layer_iterations(X,y,c,t,lambda,mu_c,mu_t,iterations,visualize)
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
K = length(c);
errors = zeros(iterations,1);
changes_c = zeros(K, iterations);
for i=1:iterations
    %% get new parameters
    c_new = update_c_batch(X, y, c, t, mu_c, lambda);
    t_new = update_t_batch(X, y, c, t, mu_t, lambda);
    %% get changes for c/iteration
    c = c_new;
    changes_c(:, i) = c_new - c;
    %% update params
    c = c_new;
    t = t_new;
    %% Calculate current errors
    current_error = compute_Hf(X, y, c, t, lambda);
    errors(i) = current_error;
end
if visualize
    %% plot error progression
    figure
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors);
    %% plot changes in param c
    for k=1:K
        c_changes_i = changes_c(k,:); % (1 x iterations)
        %subplot(K,1,k)
        figure
        plot(iteration_axis,c_changes_i)
        title(strcat('c-- ', num2str(k) ) )
    end
end
end