function [ c, t_1, t_2 ] = learn_HBF_parameters_2_hidden_layer(X,Y,c,t,lambda,mu_c,mu_t_1, mu_t_1, prec, visualize)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K2 x 1)
%       t_2 = centers (Dp x Dd x Np)
%       t_1 = centers (K1 x K2)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t_1 = (1 x 1)
%       mu_t_2 = (1 x 1)
%       prec = precision of Hf vs Hf* (1 x 1)
%       visualize = whether to plot the error or not.
%   Outputs:
%       c = weights (K_2 x 1)
%       t_1 = centers (K_1 x K_2)
%       t_2 = centers (D_p x D_d x N_p)
current_error = compute_Hf(X, Y, c, t, lambda);
prev_error = inf;
i = 1;
%print_errors_debug(prev_error,current_error, prec, i);
errors = cell(1,1);
errors{1,1} = current_error;
while abs(current_error - prev_error) > prec
    prev_error = current_error;
    % Compute Gradients
    dhf_dc = compute_weight_gradient(X, Y, c, t, lambda); % Computes gradient wrt to weights c's
    dhf_dt = compute_center_gradient(X, Y, c, t, lambda); % Computes gradient wrt to ceters t's
    % Update parameters
    c = c - mu_c * dhf_dc;
    t = t - mu_t_1 * dhf_dt;
    current_error = compute_Hf(X, Y, c, t, lambda);
    errors{i} = current_error;
    i = i + 1;
    %print_errors_debug(prev_error,current_error, prec, i);
end
if visualize
    errors = cell2mat(errors);
    iteration_axis = 1:length(errors);
    plot(iteration_axis, errors );
end
end

