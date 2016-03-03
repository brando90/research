function [ mu_c, G_c ] = choose_step_size_c_adagrad( eta_c, gc, G_c )
%
G_c = G_c + gc.^2;
mu_c = eta_c ./ ( (G_c).^0.5 );
end