function [ f_x, z, a ] = f( x,c,t )
%computes 1HBF
%   Computes f(x) 
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x D)
%       t = centers (D+1 x K)
%   Outputs:
%       f = h^*(x) (D+1 x 1)
%       z = (K x 1)
%       a = (K x 1)
[z, a] = forward_pass(x,t); % (K x 1) , (K x 1)
f_x = c' * a; % (D x 1) = (K x D)' * (K x 1) = (D x K) * (K x 1)
%f_x = f_x/sum(f_x);
end