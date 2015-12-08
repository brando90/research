function [ t_new, dHf_dt ] = update_t_batch(Kern,y, mdl_params )
%update_t_batch
dHf_dt = compute_dHf_dt(X,y, mdl.c,mdl.t,mdl.beta, lambda);
mu_t = choose_step_size(Kern, dHf_dt, y, mdl_params.c);
t_new = mdl.t - mu_t * dHf_dt;
end