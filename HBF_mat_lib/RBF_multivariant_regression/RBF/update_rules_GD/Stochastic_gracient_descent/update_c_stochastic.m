function [ c_new, dJ_dc,G_c_new, mu_c] = update_c_stochastic(f_x,a,y, mdl, G_c,eta_c)
%RBF
dJ_dc = compute_dV_dc_vec( f_x,a, y ); %((K x L)
[mu_c, G_c_new] = choose_step_size_c_adagrad(eta_c, dJ_dc, G_c);
dJ_dc = dJ_dc + mdl.lambda * 0; %TODO
%% update
c_new = mdl.c - mu_c .* dJ_dc;
end