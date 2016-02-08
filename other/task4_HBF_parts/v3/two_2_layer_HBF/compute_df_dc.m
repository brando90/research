function [ df_dc ] = compute_df_dc(a_l3)
%   computes c according to:
%       df_dc
%   Input:
%       a_l3 = activations l3 (K2 x 1)
%   Output:
%       c = updated weights (K2 x 1)
df_dc = a_l3;
end

