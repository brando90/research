function [ dJ_dc ] = compute_c_gradient(y,f,a_l3)
%compute_c_gradient - updates the c parameter of a 2 layer HBF
%   computes c according to:
%       dJ_dc
%   Input:
%       c = weights (K2 x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       a_l3 = activations l3 (K2 x 1)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       c = updated weights (K2 x 1)
dJ_dc = -2 * (y - f) * a_l3;
end

