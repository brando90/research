function [ dJ_dt2 ] = compute_df_dt2_vectorized(t2,c,z_l2,a_l2)
%update_t2_gradient - updates the t2 parameter of a 2 layer HBF
%   Computes t2 according to:
%       dJ/dt2
%   Input:
%       t2 = weights (K1 x K2)
%       c = weights (K2 x 1)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%   Output:
%       dJ_dt2 (K1 x K2)
alpha = c .* exp(-z_l2);
[Np, Dd] = size(a_l2);
K1 = Np * Dd;
a_l2_col = reshape(a_l2', [K1, 1]);
dJ_dt2 = 2*bsxfun(@times,alpha',bsxfun(@minus, a_l2_col, t2) );
end