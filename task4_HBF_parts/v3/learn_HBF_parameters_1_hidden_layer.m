function [ c_new, t_new ] = learn_HBF_parameters_1_hidden_layer(X,Y,c,t,lambda,mu_c,mu_t, prec, visualize)
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
%       c_new = learned weights (K x 1)
%       t_new = learned centers (D x K)
[D, K] = size(t);
c_new = zeros(K,1);
t_new =  zeros(D,K);
current_error = compute_Hf(X, Y, c, t, lambda);
errors = cell(1,1);
errors{1,1} = current_error;
prev_error = inf;
i = 1;
while abs(current_error - prev_error) > prec
    prev_error = current_error;
    % Compute Gradients
    dhf_dc = compute_weight_gradient(X, Y, c, t, lambda); % Computes gradient wrt to weights c's
    dhf_dt = compute_center_gradient(X, Y, c, t, lambda); % Computes gradient wrt to ceters t's
    % Update parameters
    c_new = c_new - mu_c * dhf_dc;
    t_new = t_new - mu_t * dhf_dt;
    current_error = compute_Hf(X, Y, c_new, t_new, lambda);
    errors{i} = current_error;
    i = i + 1;
end
if visualize
    errors = cell2mat(errors);
    iteration_axis = 1:length(errors);
    plot(iteration_axis, errors );
end
end

