function [ t_new ] = update_t_stochastic( X, y, c, t, mu_t, lambda )
%update_t_stochastic
[~, N] = size(X);
i = randi(N);
xi = X(:,i);
yi = y(i);
df_dt = compute_df_dt(xi, yi, c, t, lambda);
fi = f(xi,yi,c,t);
delta_i = fi - yi;
dJ_dt = (-2*delta_i)*df_dt;
t_new = t - mu_t * dJ_dt;
end