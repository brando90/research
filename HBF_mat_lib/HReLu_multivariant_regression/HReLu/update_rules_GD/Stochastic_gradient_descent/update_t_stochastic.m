function [t_new, dJ_dt,G_t_new, mu_t] = update_t_stochastic(f_x,a,z, x,y, mdl, G_t,eta_t)
%update_t_batch
dJ_dt = compute_dV_dt_vec(f_x,a,z, x,y, mdl);
[mu_t, G_t_new] = choose_step_size_t_adagrad(eta_t, dJ_dt, G_t);
%mu_t = choose_step_size_t_stochastic(x,y, mdl_params.c,mdl_params.t,mdl_params.beta, dJ_dt);
dJ_dt = dJ_dt + 0 * mdl.lambda; %TODO
%% update
%t_new = mdl_params.t - mu_t * dJ_dt;
t_new = mdl.t - mu_t .* dJ_dt;
end