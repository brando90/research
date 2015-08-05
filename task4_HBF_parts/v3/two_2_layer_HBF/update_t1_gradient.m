function [ t1 ] = update_t1_gradient(t1,x,y,f,z_l1,z_l2,a_l2,c,t2,lambda,mu_t1,Dp)
%update_t1_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t1 according to:
%       t1 := t1 - mu_c * dJ/dt1
%   Input:
%       t1 = centers (Dp x Dd x Np)
%       x = data (D x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       t1 = updated weights (K2 x 1)
[Np, Dd] = size(a_l2);
x_parts = reshape(x, [Dp, Np])'; % Np x Dp
K1 = Np * Dd;
a_l2_col_vec = reshape(a_l2', [K1, 1]); %K1 x 1
alpha = bsxfun(@minus, a_l2_col_vec, t2); %K1 x K2
c_z_l2 = (c .* exp(-1 * z_l2))'; % 1 x K2
alpha = bsxfun(@times, c_z_l2, alpha); %K1 x K2
alpha = bsxfun(@times, reshape(exp(-1 * z_l1'),[K1, 1]) , alpha);
alpha = sum(alpha, 2); %K1 x 1
xi_t1 = bsxfun(@minus, x_parts', permute(t1, [1,3,2]));
% alpha K1 x 1
% xi_t1 Dp x Np x Dd
dJ_dt1 = bsxfun(@minus, reshape(alpha,[Dd, Np]), permute(xi_t1, [3, 2, 1]));
dJ_dt1 = permute(dJ_dt1,[3,1,2]);
dJ_dt1 = -4*(y-f)*dJ_dt1;
dJ_dt1 = dJ_dt1 + lambda * 0;
%% update
t1 = t1 - mu_t1 * dJ_dt1;
end