function [ mu_t ] = choose_step_size_t_stochastic(x,y, c,t,beta, dV_dt)
%
function h_val = h(eta)
    f_x = f(x, c ,t - eta*dV_dt ,beta);
    h_val = norm(f_x - y,2)^2;
end
eta_guess = rand(1);
[eta_min,~,~] = fminsearch(@h,eta_guess);
mu_t = eta_min;
end