function [ t_new ] = update_t_batch( X, y, c, t, mu_t, lambda )
%update_t_batch
dHf_dt = 0;
for i=1:N
    xi = X(:,i);
    yi = y(i);
    df_dt = compute_df_dt(xi, c, t, lambda);
    fi = f(xi,yi,c,t);
    delta_i = fi - yi;
    dJ_dt = (-2*delta_i)*df_dt;
    dHf_dt = dHf_dt + dJ_dt;
end
t_new = t - mu_t * dHf_dt;
end