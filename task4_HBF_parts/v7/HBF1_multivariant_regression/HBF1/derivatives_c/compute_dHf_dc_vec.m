function [ dHf_dc ] = compute_dHf_dc_vec(Kern,y, c,lambda)
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
% output: 
%       dHf_dc = (N x D)
[~, N] = size(Kern);
y = y';
dHf_dc = (2/N) * ( Kern' * (Kern * c - y) ); % (N x D)
regularized_cost = 0;
dHf_dc = dHf_dc + lambda * regularized_cost;
end