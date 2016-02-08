function [ c_new ] = update_c_stochastic( X, y, c, t, mu_c, lambda )
%update_c_stochastic
[~, N] = size(X);
i = randi(N);
xi = X(:,i);
yi = y(i);
df_dc = compute_df_dc(xi, yi, c, t, lambda);
fi = f(xi, yi, c, t);
delta_i = fi - yi;
dJ_dc = (-2 * delta_i) * df_dc;
c_new = t - mu_c * dJ_dc;
end

