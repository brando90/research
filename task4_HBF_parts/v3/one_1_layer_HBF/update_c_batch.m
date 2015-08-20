function [ c_new ] = update_c_batch( X, y, c, t, mu_c, lambda )
%update_c_batch
[~, N] = size(X);
dHf_dc = 0;
for i=1:N
    xi = X(:,i);
    yi = y(i);
    df_dc = compute_df_dc(xi, c, t, lambda);
    fi = f_star(xi, c, t);
    delta_i = fi - yi;
    dJ_df = -2 * delta_i;
    dJ_dc = dJ_df * df_dc;
    dHf_dc = dHf_dc + dJ_dc;
end
c_new = c - mu_c * dHf_dc;
end