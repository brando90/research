function [ dh_dc ] = compute_dh_dc(a,L)
%   computes c according to:
%       dh_dc
%   Input:
%       a = activations (K x 1)
%       L = number of labels (1 x 1)
%   Output:
%       dh_dc = df_dc (K x L)
dh_dc = repmat(a,1,L);
end