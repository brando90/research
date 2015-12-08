function [ c_new, dHf_dc, mu_c ] = update_c_batch(Kern,y, mdl_params )
%update_c_batch
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%   Output:
dHf_dc = compute_dHf_dc_vec(Kern,y, mdl_params.c,mdl_params.lambda); %((K x L)
mu_c = choose_step_size(Kern, dHf_dc, y, mdl_params.c);
%% update
c_new = mdl_params.c - mu_c * dHf_dc;
end