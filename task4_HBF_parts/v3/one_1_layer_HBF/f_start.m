function [ f ] = f_start( x, c, t )
%f_start - computes HBF predictor
%   Computes f^*(x) = sum_i c_i exp( - || x_i - t_i ||^2)
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%   Outputs:
%       f = f^*(x) = sum_k c_k exp( - || x - t_k ||^2)
[~, K] = size(t);
f = 0;
for k=1:K
    c_k = c(k);
    t_k = t(:, k);
    norm_squared = norm(x - t_k, 2)^2;
    f = f + c_k * exp( -1 * norm_squared );
end
end

