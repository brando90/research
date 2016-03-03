function [ dHf_dc ] = compute_dHf_dc( Kern,y, c, lambda )
% output: 
%       dHf_dc = (N x D)
[~, N] = size(Kern);
y = y';
dHf_dc = (2/N) * ( Kern' * (Kern * c - y) ); % (N x D)
regularized_cost = 0;
dHf_dc = dHf_dc + lambda * regularized_cost;
end