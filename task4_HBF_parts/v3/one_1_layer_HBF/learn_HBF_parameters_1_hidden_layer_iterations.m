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
errors = zeros(iterations,1);
for i=1:iterations
    % Update parameters
    c_new = update_c_batch(X, y, c, t, mu_c, lambda);
    t_new = update_t_batch(X, y, c, t, mu_t, lambda);
    c = c_new;
    t = t_new;
    % Calculate current errors
    current_error = compute_Hf(X, y, c, t, lambda);
    errors(i) = current_error;
end
if visualize
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors);
end
end