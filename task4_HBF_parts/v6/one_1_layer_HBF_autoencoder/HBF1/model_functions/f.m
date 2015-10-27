function [ f_x, z, a ] = f( x,c,t,beta )
%computes 1HBF
%   Computes f(x) 
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x D)
%       t = centers (D x K)
%   Outputs:
%       f = h^*(x) (D x 1)
%       z = (K x 1)
%       a = (K x 1)
[z, a] = forward_pass( x,t,beta );
f_x = c' * a;
end