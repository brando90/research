function [ mu_t, G_t ] = choose_step_size_t_adagrad( eta_t, gt, G_t )
%
G_t = G_t + gt.^2;
mu_t = eta_t ./ ( (G_t).^0.5 );
end