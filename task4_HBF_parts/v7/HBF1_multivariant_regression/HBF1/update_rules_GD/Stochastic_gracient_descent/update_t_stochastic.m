function [t_new, dJ_dt, mu_t] = update_t_stochastic(f_x,a, x,y, mdl_params)
%update_t_batch
dJ_dt = compute_dV_dt_vec(f_x,a, x,y, mdl_params );
mu_t = choose_step_size_t_stochastic(x,y, mdl_params.c,mdl_params.t,mdl_params.beta, dJ_dt);
dJ_dt = dJ_dt + 0 * mdl_params.lambda; %TODO
%% update
t_new = mdl_params.t - mu_t * dJ_dt;
end