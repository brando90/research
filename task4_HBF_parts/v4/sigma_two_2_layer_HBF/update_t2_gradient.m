function [ t2_new, dJ_dt2 ] = update_t2_gradient(t2, y,f, z_l2_p,a_l2,c,sig, mu_t2, lambda)
%update_t2_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t2 according to:
%       t2 := t2 - mu_c * dJ/dt2
%   Input:
%       t2 = weights (K1 x K2)
%       c = weights (K2 x L)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       lambda = reg param (1 x 1)
%       mu_t2 = step size (1 x 1)
%   Output:
%       t2 = updated weights (K2 x 1)
%       dJ_dt2 = derivative (K2 x 1)
[K1, K2] = size(t2);
[~, L] = size(c);
df_dt2_M = zeros(K1, K2, L);
for l=1:L
    c_l = c(:, l);
    df_dt2_l = compute_df_dt2_loops(t2, z_l2_p,a_l2, c_l, sig); % (K1 x K2)
    df_dt2_M(:,:, l) = df_dt2_l;
end
dJ_df_l = ((1:L) == y)' -  prob_y_x(f); %(L x 1)
dJ_df_M = repmat(dJ_df_l, K1, 1, K2); % (K1 x L x K2)
dJ_df_M = permute(dJ_df_M, [1,3,2]); % (K1 x K2 x L)
df_dt2_M = dJ_df_M .* df_dt2_M; % (K1 x K2 x L)
dJ_dt2 = sum(df_dt2_M,3); % (K1 x K2)
dJ_dt2 = dJ_dt2 + lambda * 0; %TODO
%dJ_dt2
%% update
t2_new = t2 - mu_t2 * dJ_dt2;
end