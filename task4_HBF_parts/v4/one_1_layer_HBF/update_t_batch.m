function [ t_new ] = update_t_batch( X, y, c, t, mu_t, lambda )
%update_t_batch
dHf_dt = compute_dHf_dt(X, y, c, t, lambda);
t_new = t - mu_t * dHf_dt;
end