function [ mu_c ] = choose_step_size_c_stochastic_closed_soln( f_x, a, dV_dc, y )
%%step_size closed form
Kx = a'; % (1 x K)
Kdelta = Kx * dV_dc; % (1 x D) = (1 x K) * (K x D)
denom = sum(Kdelta .* (f_x - y)'); % (1 x 1)
num = sum(Kdelta .* Kdelta);
mu_c = denom / num;
end