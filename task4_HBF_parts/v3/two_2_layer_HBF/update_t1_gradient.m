function [ t1 ] = update_t1_gradient(t1,x,y,f,z_l1,z_l2,a_l2,a_l3,c,t2,lambda,mu_t1)
%update_t1_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t1 according to:
%       t1 := t1 - mu_c * dJ/dt1
%   Input:
%       x = data (Dp x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (Np x Dd)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       t1 = updated weights (K2 x 1)
x_parts = reshape(x, [Dp, Np])'; % Np x Dp
[Np, Dp] = size(a_l2);
K1 = Np * Dp;
a_l2_col_vec = reshape(a_l2, [K1, 1]);
alpha = bsxfun(@minus, a_l2_col_vec, t2);
alpha = reshape(alpha, [Np, Dp]);
xi_t1 = bsxfun(@minus, x_parts, t1);
permute(bsxfun(@minus, alpha, permute(xi_t1, [1, 3, 2])), [1, 3, 2]);
end