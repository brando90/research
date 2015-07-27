function [ dh_dc ] = compute_weight_gradient( X, Y, c, t, lambda )
%compute_weight_gradient = Computes the gradient for c's
%   computes dHf/dc_k = - 2 sum delta_i g(||x_i - t_k||^2)
%   inputs:
%       X = data matrix (D x N)
%       Y = labels (D x 1)
%       c = weights (K x 1)
%       t = centers (D  x K)
%       lambda = regularization param (1 x 1)
%   output:
%       dh_dc = gradient wrt c (K x 1)
[~, N] = size(X);
K = length(c);
dh_dc = zeros(K, 1);
for k=1:K
    total_gradient_ck = 0;
    for i=1:N
        x_i = X(:,i);
        y_i = Y(i);
        f_i = f_start(x_i, c ,t);
        delta_i = f_i - y_i;
        t_k = t(:,k);
        norm_squared = norm(x_i - t_k, 2)^2;
        G_i = exp(-1 * norm_squared);
        total_gradient_ck = total_gradient_ck + delta_i * G_i;
    end
    dh_dc(k) = -2 * total_gradient_ck;
    regularization_derivative = 0; %TODO
    dh_dc(k) = dh_dc(k) + regularization_derivative * lambda;
end
end

