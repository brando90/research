function [ df_dt ] = compute_df_dt( xi, c, t, lambda )
%update df_dt
[D, K] = size(t);
df_dt = zeros(D, K);
for k=1:K
    ck = c(k);
    tk = t(:,k);
    norm_squared = norm(xi - tk, 2)^2;
    Gi_prime = -exp(-norm_squared);
    df_dt(:, k) = -2*ck*Gi_prime*(xi - tk);
    regularization_derivative = 0; %TODO
    df_dt(:, k) = df_dt(:, k) + regularization_derivative * lambda;
end
end