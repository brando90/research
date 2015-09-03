function [ j ] = J(x,y, c,t1,t2,sig)
%Computes J(y, f(x)) = ( y - f(x) )^2
%   Computes J(y, f(x)) = ( y - f(x) )^2 for current parameter setting
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (1 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       J(y, f(x)) = (y - f(x))^2
[ f_x, ~, ~, ~, ~ ] = f( x, c,t1,t2,sig);
j = (y - f_x)^2;
end