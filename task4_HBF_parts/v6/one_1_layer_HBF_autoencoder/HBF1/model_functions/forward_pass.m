function [ z, a ] = forward_pass( x, t, beta )
%   Inputs:
%       x = data point (D x 1)
%       t = centers (D x K)
%       beta = precision of guasssian (1 x 1)
%   Outputs:
%       z = (K x 1)
%       a = activation the single layer (K x 1)
[~, K] = size(t);
z = zeros(K,1);
for k=1:K
    t_k = t(:,k);
    z(k) = norm(x - t_k, 2)^2;
end
%z = pdist2(x', t').^2; %(1 x K)
a = exp(-beta*z); %(K x 1)
end