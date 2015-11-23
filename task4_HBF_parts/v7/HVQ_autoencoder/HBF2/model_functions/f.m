function [ f_x, z_l1, z_l2, a_l2, a_l3 ] = f( x, c, t1, t2, sig )
%f_start - computes 2 layer HBF predictor
%   Computes f^*(x) = sum_i c_i a^(3)_i
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       f_x = f^*(x) = sum_i c_i a^(3)_i (L x 1)
%       f_x_num = f_x numerator (L x 1)
%       f_x_den = f_x denominator (1 x 1)
%       z_l1 = inputs l1 (Np x Dd x L)
%       z_l2 = inputs l2 (K2 x L)
%       a_l2 = activations l2 (Np x Dd x L)
%       a_l3 = activations l3 (K2 x L)
[ h_x, z_l1, z_l2,a_l2,a_l3 ] = h( x, c, t1, t2, sig );
f_x = prob_y_x(h_x);
end