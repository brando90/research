function [ df_dc ] = compute_df_dc(a_l3,L)
%   computes c according to:
%       df_dc
%   Input:
%       a_l3 = activations l3 (K2 x 1)
%       L = number of labels (1 x 1)
%   Output:
%       c = df_dc (K2 x L)
df_dc = repmat(a_l3,1,L);
end