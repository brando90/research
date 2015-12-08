function [ c_new, dHf_dc ] = update_c_batch(F,Kern, X,y, mdl_params )
%update_c_batch
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%   Output:
dHf_dc = compute_dHf_dc(F,Kern, X,y, mdl_params); %((K x L)
mu_c = choose_step_size(Kern, dHf_dc, y, mdl_params.c);
%% update
c_new = mdl.c - mu_c * dHf_dc;
end