function [ c_new, t_new ] = learn_HBF_parameters_1_hidden_layer(X,Y,c,t,lambda,mu_c,mu_t, err)
%learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t = (1 x 1)
%   Outputs:
%       c_new = learned weights (K x 1)
%       t_new = learned centers (D x K)
current_error = 
while current_error > err
    % Compute Gradients
    dhf_dc = compute_weight_gradient(X, Y, c, t, lambda); % Computes gradient wrt to weights c
    dhf_dt = compute_center_gradient(); %
    % Update parameters
    c_new = c_new - mu_c * dhf_dc;
    t_new = t_new - mu_t * dhg_dt;
    current_error = compute_Hf(X, Y, c_new, t_new, lambda);
end

end

