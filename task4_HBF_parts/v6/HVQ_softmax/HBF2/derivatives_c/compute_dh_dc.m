function [ dh_dc ] = compute_dh_dc(a_l3,L)
%   computes c according to:
%       dh_dc
%   Input:
%       a_l3 = activations l3 (K2 x 1)
%       L = number of labels (1 x 1)
%   Output:
%       dh_dc = df_dc (K2 x L)
dh_dc = repmat(a_l3,1,L);
end