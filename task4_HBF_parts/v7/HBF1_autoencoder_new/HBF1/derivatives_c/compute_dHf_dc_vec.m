function [ dHf_dc ] = compute_dHf_dc_vec(X,y, c,t,beta, lambda)
%Computes dHf_dc
%   Input:
%       X = data (D x N)
%       y = labels (D x N)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%   Output:
%       dHf_dc = derivative (K x L)
%[K, ~] =size(c);
[~, N] = size(X);
K = produce_kernel_matrix( X, t, beta);
size(K')
size(K)
size(c)
size(y)
dHf_dc = (2/N)*(K'*K*c - K'*y');
regularization_term = 0; %TODO
dHf_dc = dHf_dc + lambda * regularization_term;
end