function [ regularized_cost_hf ] = compute_Hf( X, y, c, t, lambda )
%compute_Hf - computes regularized cost 
%H[F] = sum (y_i, f(x_i))^2 + lambda || Pf ||^2
%   Inputs:
%       c = weights (K x 1)
%       t = centers (D  x K)
%   Outputs:
%       regularized_cost_hf = cost H[f]=sum(y_i,f(x_i))^2+lambda||Pf||^2
[~, N] = size(X);
empirical_risk = 0;
for i=1:N
    xi = X(:, i);
    fi = f_star(xi, c, t);
    yi = y(i);
    delta_i = yi - fi;
    empirical_risk = empirical_risk + delta_i^2;
end
regularization_penalty = 0; %TODO
regularized_cost_hf =  empirical_risk + lambda * regularization_penalty;
end