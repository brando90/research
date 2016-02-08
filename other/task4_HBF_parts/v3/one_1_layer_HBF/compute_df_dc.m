function [ df_dc ] = compute_df_dc( xi, c, t, lambda )
% df_dc
K = length(c);
df_dc = zeros(K, 1);
for k=1:K
    tk = t(:,k);
    z = norm(xi - tk, 2)^2;
    G_i = exp(-z);
    df_dc(k) = G_i;
    regularization_derivative = 0; %TODO
    df_dc(k) = df_dc(k) + regularization_derivative * lambda;
end
end