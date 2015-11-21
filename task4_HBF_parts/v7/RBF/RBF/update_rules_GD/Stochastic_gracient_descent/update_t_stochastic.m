function [ t_new, dJ_dt ] = update_t_stochastic(f_x,z,x,y, mdl, mu_t, lambda )
%update_t_batch
dJ_dt = compute_dJ_dt(f_x,z,x,y,mdl.t,mdl.c);
dJ_dt = dJ_dt + 0 * lambda; %TODO
t_new = mdl.t - mu_t * dJ_dt;
end