function [ f ] = f_star( x, c, t)
%f_star - computes 1HBF
%   Computes f^*(x) 
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%   Outputs:
%       f = f^*(x)
a = exp(-pdist2(x', t').^2);
f = dot(a, c);
end