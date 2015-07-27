function [ c_new, t_new ] = learn_HBF_parameters_1_hidden_layer(X,Y,c,t,lambda,mu_c,mu_t, err, iterations, visualize)
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
[D, K] = size(t);
c_new = zeros(K,1);
t_new =  zeros(D,K);
if iterations == 0 
    current_error = compute_Hf(X, Y, c, t, lambda);
    iterations = 0;
    while current_error > err
        % Compute Gradients
        dhf_dc = compute_weight_gradient(X, Y, c, t, lambda); % Computes gradient wrt to weights c's
        dhf_dt = compute_center_gradient(X, Y, c, t, lambda); % Computes gradient wrt to ceters t's
        % Update parameters
        c_new = c_new - mu_c * dhf_dc;
        t_new = t_new - mu_t * dhf_dt;
        current_error = compute_Hf(X, Y, c_new, t_new, lambda);
        iterations = iterations + 1;
    end
else
    errors = zeros(iterations,1);
    for i=1:iterations
        % Compute Gradients
        dhf_dc = compute_weight_gradient(X, Y, c, t, lambda); % Computes gradient wrt to weights c's
        dhf_dt = compute_center_gradient(X, Y, c, t, lambda); % Computes gradient wrt to ceters t's
        % Update parameters
        c_new = c_new - mu_c * dhf_dc;
        t_new = t_new - mu_t * dhf_dt;
        current_error = compute_Hf(X, Y, c_new, t_new, lambda);
        errors(i) = current_error;
    end
    if visualize
        iteration_axis = 1:iterations;
        plot(iteration_axis, errors);
    end
end

