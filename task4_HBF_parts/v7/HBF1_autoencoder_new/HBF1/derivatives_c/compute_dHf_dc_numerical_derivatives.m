function [ dHf_dc_numerical ] = compute_dHf_dc_numerical_derivatives( X,y,c,t,beta,lambda, eps)
%compute_dHf_dc_numerical_derivative
%   Input:
%       X = data (D, N)
%       y = label (N x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%       eps = epsilon (1 x 1)
%   Output:
%       dHf_dc_numerical = (K, L)
[K, L] = size(c);
dHf_dc_numerical = zeros(K, L);
for l=1:L
    for k=1:K
        e = zeros([K,L]);
        e(k,l) = eps;
        Hf_e1 = compute_Hf_sq_error(X,y,HBF1(c + e,t,beta), lambda );
        Hf_e2 = compute_Hf_sq_error(X,y,HBF1(c - e,t,beta), lambda );
        numerical_derivative = (Hf_e1 - Hf_e2)/(2*eps);
        dHf_dc_numerical(k,l) = numerical_derivative;
    end
end
end