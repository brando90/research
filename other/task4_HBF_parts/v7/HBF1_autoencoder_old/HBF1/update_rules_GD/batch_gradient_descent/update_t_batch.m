function [ t_new, dHf_dt ] = update_t_batch( X,y, mdl, mu_t, lambda )
%update_t_batch
dHf_dt = compute_dHf_dt(X,y, mdl.c,mdl.t,mdl.beta, lambda);
t_new = mdl.t - mu_t * dHf_dt;
end