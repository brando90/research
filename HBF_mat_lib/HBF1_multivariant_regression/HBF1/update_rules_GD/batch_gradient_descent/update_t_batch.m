function [ t_new, dHf_dt, mu_t ] = update_t_batch(F,Kern, X,y, mdl_params )
%update_t_batch
%dHf_dt = compute_dHf_dt_vec(F,Kern, X,y, mdl_params );
dHf_dt = compute_dHf_dt_vec(F,Kern, X,y, mdl_params );
mu_t = choose_step_size_batch(F,Kern, dHf_dt', y);
t_new = mdl_params.t - mu_t * dHf_dt;
end