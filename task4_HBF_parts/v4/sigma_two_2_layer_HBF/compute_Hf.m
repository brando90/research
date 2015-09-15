function [ regularized_cost_hf ] = compute_Hf(X,y, c,t1,t2,sig, lambda)
%compute_Hf - computes regularized cost 
%H[F] = sum (y_i, f(x_i))^2 + lambda || Pf ||^2
%   Inputs:
%       X = data matrix (D x N)
%       y = labels (N x 1)
%       c = weights (K_2 x L)
%       t_2 = centers (D_p x D_d x N_p)
%       t_1 = centers (K_1 x K_2)
%   Outputs:
%       regularized_cost_hf = cost H[f]=sum(y_i,f(x_i))^2+lambda||Pf||^2
[~, N] = size(X);
empirical_risk = 0;
for i=1:N
    x_i = X(:, i);
    y_i = y(i);
    J_xy_theta = J(x_i,y_i, c,t1,t2,sig);
    empirical_risk = empirical_risk + J_xy_theta;
end
regularization_penalty = 0; %TODO
regularized_cost_hf =  empirical_risk + lambda * regularization_penalty;
end