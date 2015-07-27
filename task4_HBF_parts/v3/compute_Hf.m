function [ regularized_cost_hf ] = compute_Hf( X, Y, c, t, lambda )
%compute_Hf - computes regularized cost 
%H[F] = sum (y_i, f(x_i))^2 + lambda || Pf ||^2
%   Inputs:
%       c - weights (K x 1)
%       t = centers (D  x K)
%   Outputs:
%       regularized_cost_hf = cost H[f]=sum(y_i,f(x_i))^2+lambda||Pf||^2
[~, N] = size(X);
empirical_risk = 0;
for i=1:N
    x_i = X(:, i);
    f_i = f_start(x_i, c, t);
    y_i = Y(i);
    delta_i = y_i - f_i;
    empirical_risk = empirical_risk + delta_i^2;
end
regularization_penalty = 0; %TODO
regularized_cost_hf =  empirical_risk + lambda * regularization_penalty;
end