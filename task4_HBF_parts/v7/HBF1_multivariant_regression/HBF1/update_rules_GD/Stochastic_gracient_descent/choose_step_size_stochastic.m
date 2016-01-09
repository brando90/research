function [ mu_theta ] = choose_step_size_stochastic(a, dV_dtheta, y)
%
Kx = a'; % (1 x K)
Kdelta = Kx * dV_dtheta; % (1 x D) = (1 x K) * (K x D)
denom = sum(Kdelta .* (f - y)'); % (1 x 1)
num = sum(Kdelta .* Kdelta);
mu_theta = denom / num;
end