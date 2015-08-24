function [ f, z_l1, z_l2, a_l2, a_l3 ] = f_star( x, c, t1, t2 )
%f_start - computes 2 layer HBF predictor
%   Computes f^*(x) = sum_i c_i a^(3)_i
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       f = f^*(x) = sum_i c_i a^(3)_i
%       a_l3 = activations l3 (K2 x 1)
%       z_l2 = inputs l2 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       z_l1 = inputs l1 (Np x Dd)

[ f, z_l1, z_l2, a_l2, a_l3 ] = f_star_loops( x, c, t1, t2 );

%[ f, z_l1, z_l2, a_l2, a_l3 ] = f_star_vec( x, c, t1, t2 );
end