function [ c_new, dJ_dc ] = update_c_stochastic(f_x,y,a, mdl, mu_c, lambda )
%update_c_batch
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%       X = data (D, N)
%       y = label (N x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       beta = precision (1 x 1)
%       mu_c = step size (1 x 1)
%       lambda = reg param (1 x 1)
%   Output:
%       c = updated weights (K x L)
%       dHf_dc = derivative (K x L)
dJ_dc = compute_dJ_dc(f_x,y,a); %((K x L)
dJ_dc = dJ_dc + lambda * 0; %TODO
%% update
c_new = mdl.c - mu_c * dJ_dc;
end