function [ dJ_dt2 ] = compute_t2_gradient(t2,c,y,f,z_l2,a_l2)
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
alpha = c .* exp(-z_l2);
[Np, Dd] = size(a_l2);
K1 = Np * Dd;
a_l2_col = reshape(a_l2', [K1, 1]);
dJ_dt2 = -2*2*(y - f)*bsxfun(@times,alpha',bsxfun(@minus, a_l2_col, t2) );
end