function [ c_new ] = update_c_batch( X, y, c, t, mu_c, lambda )
%update_c_batch
dHf_dc = 0;
for i=1:N
    xi = X(:,i);
    yi = y(i);
    df_dc = compute_df_dc(xi, yi, c, t, lambda);
    fi = f(xi, yi, c, t);
    delta_i = fi - yi;
    dJ_dc = (-2 * delta_i) * df_dc;
    dHf_dc = dHf_dc + dJ_dc;
end
c_new = t - mu_c * dHf_dc;
end

