function [ regularized_cost_hf ] = compute_Hf( X,y, mdl )
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
    x_i = X(:, i);
    y_i = y(i);
    j_xy = J(x_i,y_i, mdl);
    empirical_risk = empirical_risk + j_xy;
end
regularization_penalty = 0; %TODO
regularized_cost_hf =  empirical_risk + lambda * regularization_penalty;
end