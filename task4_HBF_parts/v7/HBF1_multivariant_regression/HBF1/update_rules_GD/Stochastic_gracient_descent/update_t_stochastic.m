function [t_new, dV_dt, mu_t] = update_t_stochastic(f_x,x,y, mdl_params)
%update_t_batch
dV_dt = compute_dV_dt_vec(f_x,a, x,y, mdl_params );
mu_t = choose_step_size_stochastic(a, dV_dtheta, y, mdl_params.c);
dV_dt = dV_dt + 0 * lambda; %TODO
%% update
t_new = mdl.t - mu_t * dJ_dt;
end