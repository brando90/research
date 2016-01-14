function [ mu_c ] = choose_step_size_c_stochastic( x,y,c,t,beta,dV_dc )
%
%[f_x, ~, ~] = f(x, c - eta * dV_dc ,t,beta);
h = @(eta) norm( f_x - y,2)^2;
eta_guess = rand(1);
[eta_min,~,~] = fminsearch(h,eta_guess);
mu_c = eta_min;
end