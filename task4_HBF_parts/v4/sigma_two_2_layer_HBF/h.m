function [ h_x, z_l1, z_l2,a_l2,a_l3 ] = h( x, c, t1, t2, sig )
% un processed output of the HBF Network
%   Computes f^*(x) = sum_i c_i a^(3)_i
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       h_x = sum_i c_i a^(3)_i (L x 1)
%       z_l1 = inputs l1 (Np x Dd)
%       z_l2 = inputs l2 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
[z_l1, z_l2,a_l2,a_l3] = forward_pass(x, c, t1, t2, sig);
h_x = c' * a_l3; %(K2 x L)' x (K2 x 1) = (L x 1)
end