function [ mu_c ] = choose_step_size( Kern, dHf_dtheta, y, c )
%
Kdelta = Kern*dHf_dtheta; % (N x D)
Y_Kc = y' - Kern*c; % (N x D)
denom = sum(sum(Kdelta .* (Y_Kc)));
num = sum(sum(Kdelta .* Kdelta));
mu_c = -denom/ num;
end