function [ df_dc ] = compute_dh_dc_numerical_derivatives( x,c,t,beta,eps )
%compute_df_dc_numerical_derivatives
%       x = data matrix (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       eps = epsilon (1 x 1)
[K, L] = size(c);
df_dc = zeros(K, L);
for l=1:L
    for k=1:K
        e = zeros([K,L]);
        e(k,l) = eps;
        [f_e1, ~] = h(x, c + e, t, beta);
        [f_e2, ~] = h(x, c - e, t, beta);
        numerical_derivative = (f_e1 - f_e2)/(2*eps);
        df_dc(k,l) = numerical_derivative(l);
    end
end
end