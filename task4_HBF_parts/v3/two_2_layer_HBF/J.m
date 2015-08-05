function [ j ] = J( y, x, c, t2, t1, Np, Dp)
%Computes J(y, f(x)) = ( y - f(x) )^2
%   Computes J(y, f(x)) = ( y - f(x) )^2 for current parameter setting
[ f, ~, ~, ~, ~ ] = f_star( x, c, t1, t2, Np, Dp );
j = (y - f)^2;
end