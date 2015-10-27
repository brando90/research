function [ dHf_dc ] = compute_dHf_dc(X,y,c,t,beta, lambda)
%Computes dHf_dc
%   Input:
%       X = data (D, N)
%       y = labels (N x D)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%   Output:
%       dHf_dc = derivative (K x L)
[K, L] =size(c);
[~, N] = size(X);
dHf_dc = zeros(K,L);
for i=1:N
    x_i = X(:,i);
    y_i = y(i);
    [h_x, a] = h(x_i,c,t,beta);
    dJ_dc = compute_dJ_dc(h_x,y_i,a); %(K x L)
    dHf_dc = dHf_dc + dJ_dc;
end
regularization_term = 0; %TODO
dHf_dc = dHf_dc + lambda * regularization_term;
end