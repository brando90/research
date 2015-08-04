function [c] = update_c_gradient(c,y,f,a_l3,lambda,mu_c)
%update_c_gradient - updates the c parameter of a 2 layer HBF
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%       c = weights (K2 x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (Np x Dd)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       c = updated weights (K2 x 1)
dJ_dc = 2 * (y - f) * a_l3;
dJ_dc = dJ_dc + lambda * 0; %TODO
c = c - mu_c * dJ_dc;
end