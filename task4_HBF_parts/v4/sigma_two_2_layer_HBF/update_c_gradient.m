function [ c_new, dJ_dc] = update_c_gradient(c, h,y, a_l3, mu_c, lambda)
%update_c_gradient - updates the c parameter of a 2 layer HBF
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%       c = weights (K2 x L)
%       y = label (1 x 1)
%       f = f(x) (L x 1)
%       a_l3 = activations l3 (K2 x 1)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       c = updated weights (K2 x 1)
%       dJ_dc = derivative (K2 x 1)
%disp('------------');
[K2, L] = size(c);
df_dc = compute_df_dc(a_l3,L); %(K2 x L)
dJ_df = compute_dJ_df(h,y,K2); %(K2 x L)
% disp('sizes error print')
% size(df_dc)
% size(dJ_df)
dJ_dc = dJ_df.*df_dc; %(K2 x L)
dJ_dc = dJ_dc + lambda * 0; %TODO
%dJ_dc
%% update
c_new = c - mu_c * dJ_dc; %(K2 x L)
end