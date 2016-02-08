function [ t2_new, dJ_dt2 ] = update_t2_gradient(t2,mu_t2,y,f,z_l2,a_l2,c,lambda)
%update_t2_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t2 according to:
%       t2 := t2 - mu_c * dJ/dt2
%   Input:
%       t2 = weights (K1 x K2)
%       c = weights (K2 x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       lambda = reg param (1 x 1)
%       mu_t2 = step size (1 x 1)
%   Output:
%       t2 = updated weights (K2 x 1)
%       dJ_dt2 = derivative (K2 x 1)

% for k=1:K2
%     dJ_dc = 2 * (y - f) * a_l3;
%     dJ_dc = dJ_dc + lambda * 0; %TODO
%     c = c - mu_c * dJ_dc;
% end

%a_k2 = bsxfun(@times, c', bsxfun(@minus, b, t))
df_dt2 = compute_df_dt2_loops(t2,c,z_l2,a_l2);
dJ_df = -2*(y - f);
dJ_dt2 = dJ_df * df_dt2;
dJ_dt2 = dJ_dt2 + lambda * 0; %TODO
%dJ_dt2
%% update
t2_new = t2 - mu_t2 * dJ_dt2;
end