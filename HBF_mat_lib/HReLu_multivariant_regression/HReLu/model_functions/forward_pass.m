function [ z, a ] = forward_pass( x, t )
%   Inputs:
%       x = data point (D+1 x 1)
%       t = centers (D+1 x K)
%   Outputs:
%       z = (K x 1)
%       a = activation the single layer (K x 1)
z = t' * x;
%% Element-wise ReLu
a = z .* (z >= 0); %(K x 1)
end