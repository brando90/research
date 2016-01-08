function [ mu_theta ] = choose_step_size_stochastic( a, dV_dtheta, y)
%
Kx = a'; % (1 x K)
Kdelta = Kx * dV_dtheta; % (1 x D) = (1 x K) * (K x D)
mu_theta = sum( Kdelta .* (f - y)' ); % (1 x 1)
end