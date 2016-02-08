function [ mu_c ] = choose_step_size_c_stochastic(x,y, c,t,beta, dV_dc)
%
function h_val = h(eta)
    f_x = f(x, c - eta * dV_dc ,t,beta);
    h_val = norm(f_x - y,2)^2;
end
eta_guess =100000* rand(1);
[eta_min,~,~] = fminsearch(@h,eta_guess, optimset('MaxIter',  5.2601e+210, 'MaxFunEvals',  5.2601e+210) );
mu_c = eta_min;
end