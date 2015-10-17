function [ a ] = forward_pass( x, t, beta )
%   Inputs:
%       x = data point (D x 1)
%       t = centers (D x K)
%       beta = precision of guasssian (1 x 1)
%   Outputs:
%       a = activation the single layer (D x 1)
z = pdist2(x', t').^2;
a = exp(-1*beta*z)';
end

