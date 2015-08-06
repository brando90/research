function [ dJ_dt2 ] = compute_t2_gradient_loops(t2,c,y,f,z_l2,a_l2)
%update_t2_gradient - updates the t2 parameter of a 2 layer HBF
%   Computes t2 according to:
%       dJ/dt2
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
%       dJ_dt2 (K1 x K2)
[K1, K2] = size(t2);
dJ_dt2 = zeros([K1, K2]);
a_l2_vec = reshape(a_l2', [K1, 1]);
for k2=1:K2
    t2_k2 = t2(:,k2);
    z_l2_k2 = z_l2(k2);
    c_k2 = c(k2);
    dJ_dt2_k2 = -2*(y - f)*2*(a_l2_vec - t2_k2)*exp(-z_l2_k2)*c_k2;
    dJ_dt2(:, k2) = dJ_dt2_k2;
end
end