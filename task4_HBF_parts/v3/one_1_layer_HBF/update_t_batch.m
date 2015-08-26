function [ t_new ] = update_t_batch( X, y, c, t, mu_t, lambda )
%update_t_batch
dHf_dt = 0;
[~, N] = size(X);
for i=1:N
    xi = X(:,i);
    yi = y(i);
    df_dt = compute_df_dt(xi, c, t, lambda);
    %eps = 1e-10;
    %df_dt = compute_df_dt_numerical_derivatives(xi, c, t, eps);
    fi = f_star(xi,c,t);
    delta_i = fi - yi;
    dJ_df = -2 * delta_i;
    dJ_dt = dJ_df*df_dt;
    dHf_dt = dHf_dt + dJ_dt;
end
%dHf_dt
t_new = t - mu_t * dHf_dt;
end