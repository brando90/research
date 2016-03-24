function [ z, a ] = forward_pass_bsxfun( x, t, beta )
%   Inputs:
%       x = data point (D x 1)
%       t = centers (D x K)
%       beta = precision of guasssian (1 x 1)
%   Outputs:
%       z = (K x 1)
%       a = activation the single layer (K x 1)
%% pair-wise distances
% TX = t'*x
% xx = x.^2
% xx = sum(x.^2)
% tt = sum(t.^2)
% z = bsxfun(@plus, sum(x.^2)', sum(t.^2) ) % (K x 1)
% z_p= z - 2*(t'*x)
%z = pdist2(x', t').^2; %(1 x K)
z =  bsxfun(@plus, sum(t.^2)', sum(x.^2) ) - 2*(t'*x);
%%
a = exp(-beta*z); %(K x 1)
end