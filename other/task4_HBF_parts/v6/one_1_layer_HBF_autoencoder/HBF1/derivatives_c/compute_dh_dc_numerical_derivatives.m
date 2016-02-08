function [ dh_dc ] = compute_dh_dc_numerical_derivatives( x,c,t,beta,eps )
%compute_df_dc_numerical_derivatives
%   Input:
%       x = data matrix (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       eps = epsilon (1 x 1)
%   Output:
%       dh_dc = numerical_derivative (K x L)
[K, L] = size(c);
dh_dc = zeros(K, L);
for l=1:L
    for k=1:K
        e = zeros([K,L]);
        e(k,l) = eps;
        [h_e1, ~] = h(x, c + e, t, beta);
        [h_e2, ~] = h(x, c - e, t, beta);
        numerical_derivative = (h_e1 - h_e2)/(2*eps);
        dh_dc(k,l) = numerical_derivative(l);
    end
end
end