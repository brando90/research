function [ c, t ] = learn_HBF_parameters_1_hidden_layer(X,y,c,t,lambda,mu_c,mu_t,prec,visualize)
%learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t = (1 x 1)
%       prec = precision of Hf vs Hf* (1 x 1)
%       visualize = whether to plot the error or not.
%   Outputs:
%       c = learned weights (K x 1)
%       t = learned centers (D x K)
current_error = compute_Hf(X, y, c, t, lambda);
prev_error = inf;
i = 1;
%print_errors_debug(prev_error,current_error, prec, i);
errors = cell(1,1);
errors{1,1} = current_error;
while abs(current_error - prev_error) > prec
    prev_error = current_error;
    % Update parameters
    c = update_t_batch(X, y, c, t, mu_c, lambda); % Computes gradient wrt to weights c's
    t = update_c_batch(X, y, c, t, mu_t, lambda); % Computes gradient wrt to ceters t's
    % Update parameters
    current_error = compute_Hf(X, y, c, t, lambda);
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

