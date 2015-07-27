function [ dh_dt ] = compute_center_gradient( X, Y, c, t, lambda )
%compute_center_gradient = Computes the gradient for t's
%   computes dHf/dtk = 4 c_k sum delata_i G'(||x_i t_k ||^2)(x_i - t_k)
%   inputs:
%       X = data matrix (D x N)
%       Y = labels (D x 1)
%       c = weights (K x 1)
%       t = centers (D  x K)
%       lambda = regularization param (1 x 1)
%   outputs:
%       dh_dt = gradient wrt c (D x K)
[~, N] = size(X);
K = length(c);
dh_dt = zeros(D, K);
for k=1:K
    total_gradient_tk = zeros(D,1);
    c_k = c(k);
    for i=1:N
        x_i = X(:,i);
        y_i = Y(i);
        f_i = f_start(x_i, c ,t);
        delta_i = f_i - y_i;
        t_k = t(:,k);
        diff_xi_tk = x_i - t_k;
        norm_squared = norm(diff_xi_tk, 2)^2;
        G_i = exp(-1 * norm_squared);
        total_gradient_tk = total_gradient_tk + delta_i*G_i*diff_xi_tk;
    end
    dh_dt(:, k) = 4 * c_k * total_gradient_tk;
    regularization_derivative = 0; %TODO
    dh_dt(:, k) = dh_dt(:, k) + regularization_derivative * lambda;
end
end

