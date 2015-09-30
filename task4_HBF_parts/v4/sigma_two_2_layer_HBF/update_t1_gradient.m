function [ t1_new, dJ_dt1 ] = update_t1_gradient(t1, h,x,y, z_l1,z_l2,a_l2, c,t2,sig, mu_t1, lambda)
%update_t1_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t1 according to:
%       t1 := t1 - mu_c * dJ/dt1
%   Input:
%       t1 = centers (Dp x Dd x Np)
%       x = data (D x 1)
%       y = label (1 x 1)
%       f = f(x) (L x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       t1 = updated weights (Dp x Dd x Np)
%       dJ_dt1 = derivative (Dp x Dd x Np)
[Dp, Dd, Np] = size(t1);
[~, L] = size(c);
dJ_df_l = ((1:L) == y)' -  prob_y_x(h); %(L x 1)
dJ_dt1 = zeros(Dp, Dd, Np);
for l=1:L
    c_l = c(:, l);
    df_dt1_l = compute_df_dt1_loops(t1, x, z_l1,z_l2,a_l2, c_l,t2,sig); %(Dp x Dd x Np)
    delta_l = repmat(dJ_df_l(l), [Dp, Dd, Np]);
    dJ_dt1_l = df_dt1_l .* delta_l;
    dJ_dt1 = dJ_dt1 + dJ_dt1_l;
end
dJ_dt1 = dJ_dt1 + lambda * 0; % TODO
%% update
t1_new = t1 - mu_t1 * dJ_dt1;
end