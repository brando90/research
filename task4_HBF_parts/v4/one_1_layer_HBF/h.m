function [ h, z, a ] = h( x,c,t,beta )
%computes 1HBF
%   Computes h(x) 
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%   Outputs:
%       h = h^*(x) (L x 1)
%       z = (K x 1)
%       a = (K x 1)
[z, a] = forward_pass( x,t,beta );
h = c' * a;
end