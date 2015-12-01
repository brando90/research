function [ c_new, dHf_dc, mu_c ] = update_c_batch(Kern,y, mdl_params )
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
dHf_dc = compute_dHf_dc(Kern,y, mdl_params.c, mdl_params.lambda); % (N x D)
mu_c = choose_step_size(Kern, dHf_dc, y, mdl_params.c);
%mu_c = 10;
%% update
c_new = mdl_params.c - mu_c * dHf_dc;
end