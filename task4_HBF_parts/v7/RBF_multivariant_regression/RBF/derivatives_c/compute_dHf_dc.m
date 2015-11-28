function [ dHf_dc ] = compute_dHf_dc( X,y, c,t,beta, lambda )
%
[~, N] = size(X);
y = y';
Kern = produce_kernel_matrix( X, t, beta ); % (N x N)
dHf_dc = (2/N) * ( Kern' * Kern * c - Kern' * y); % (N x D)
regularized_cost = 0;
dHf_dc = dHf_dc + lambda * regularized_cost;
end

