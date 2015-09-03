function [ dJ_dt2 ] = compute_df_dt2_loops(t2, z_l2_p,a_l2, c,sig)
%   Computes t2 according to:
%       dJ/dt2
%   Input:
%       t2 = weights (K1 x K2)
%       c = weights (K2 x 1)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%   Output:
%       dJ_dt2 (K1 x K2)
[K1, K2] = size(t2);
dJ_dt2 = zeros([K1, K2]);
a_l2_vec = reshape(a_l2', [K1, 1]);
for k2=1:K2
    t2_k2 = t2(:,k2);
    z_l2_k2 = z_l2_p(k2);
    c_k2 = c(k2);
    dJ_dt2_k2 = 2*(a_l2_vec - t2_k2)*exp(-z_l2_k2)*c_k2*sig;
    dJ_dt2(:, k2) = dJ_dt2_k2;
end
end