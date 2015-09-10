function [ df_dt ] = compute_df_dt_numerical_derivatives( x, c, t, eps )
%compute_df_dt_numerical_derivatives
%       x = data matrix (D x 1)
%       c = weights (K x 1)
%       t = centers (D x K)
%       eps = epsilon (1 x 1)
[D, K] = size(t);
df_dt = zeros([D, K]);
for k=1:K
    for d=1:D
        e = zeros([D, K]);
        e(d,k) = eps;
        f_e1 = f_star(x, c, t+e);
        f_e2 = f_star(x, c, t-e);
        numerical_derivative = (f_e1 - f_e2)/(2*eps);
        df_dt(d,k) = numerical_derivative;
    end
end
end