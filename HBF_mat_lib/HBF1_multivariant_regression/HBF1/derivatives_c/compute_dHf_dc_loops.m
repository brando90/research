function [ dHf_dc ] = compute_dHf_dc_loops(X,y,c,t,beta, lambda)
%Computes dHf_dc
%   Input:
%       X = data (D x N)
%       y = labels (D x N)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%   Output:
%       dHf_dc = derivative (K x L)
[K, D] =size(c);
[~, N] = size(X);
dHf_dc = zeros(K,D);
for i=1:N
    x_i = X(:,i);
    y_i = y(:,i);
    [f_x, ~, a] = f(x_i,c,t,beta);
    dJ_dc = compute_dJ_dc_loops(f_x,y_i,a); %(K x L)
    dHf_dc = dHf_dc + dJ_dc/N;
end
regularization_term = 0; %TODO
dHf_dc = dHf_dc + lambda * regularization_term;
end