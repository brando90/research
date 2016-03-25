function [ z, a ] = forward_pass( x, t )
%   Inputs:
%       x = data point (D+1 x 1)
%       t = centers (D+1 x K)
%   Outputs:
%       z = (K x 1)
%       a = activation the single layer (K x 1)
z = t' * x;
% a = 1 ./ (1 + exp(z))
a = sigmf(z, [-1, 0]); %(K x 1)
end