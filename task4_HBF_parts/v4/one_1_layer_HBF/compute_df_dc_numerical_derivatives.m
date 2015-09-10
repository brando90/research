function [ df_dc ] = compute_df_dc_numerical_derivatives( x, c, t, eps )
%compute_df_dc_numerical_derivatives
%       x = data matrix (D x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%       eps = epsilon (1 x 1)
K = length(c);
df_dc = zeros([K, 1]);
for k=1:K
    e = zeros([K,1]);
    e(k) = eps;
    f_e1 = f_star(x, c + e, t);
    f_e2 = f_star(x, c - e, t);
    numerical_derivative = (f_e1 - f_e2)/(2*eps);
    df_dc(k) = numerical_derivative;
end
end