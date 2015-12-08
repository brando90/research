function [ c_new, dHf_dc ] = update_c_batch(X,y, mdl, mu_c, lambda )
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
dHf_dc = compute_dHf_dc(X,y, mdl.c,mdl.t,mdl.beta, lambda); %((K x L)
%% update
c_new = mdl.c - mu_c * dHf_dc;
end