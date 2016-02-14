function [ c_new, dJ_dc,G_c_new, mu_c] = update_c_stochastic(f_x,a, x,y, mdl_params, G_c,eta_c)
%(f_x,y,a, mdl_params)
%update_c_batch
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%dJ_dc = compute_dJ_dc(f_x,y,a); %((K x L)
dJ_dc = compute_dV_dc_vec( f_x,a, y); % f,a, y
[mu_c, G_c_new] = choose_step_size_c_adagrad(eta_c, dJ_dc, G_c);
%mu_c = choose_step_size_c_stochastic_closed_soln(f_x, a, dJ_dc, y);
%mu_c = choose_step_size_c_stochastic(x,y, mdl_params.c,mdl_params.t,mdl_params.beta, dJ_dc );
dJ_dc = dJ_dc + mdl_params.lambda * 0; %TODO
%% update
%c_new = mdl_params.c - mu_c * dJ_dc;
c_new = mdl_params.c - mu_c .* dJ_dc;
end