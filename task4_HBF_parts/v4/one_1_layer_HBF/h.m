function [ h, a ] = h( x,c,t,beta )
%computes 1HBF
%   Computes h(x) 
%   Inputs:
%       x = data point (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%   Outputs:
%       f = f^*(x) (K x L)
a = forward_pass( x,t,beta );
h = c' * a;
end