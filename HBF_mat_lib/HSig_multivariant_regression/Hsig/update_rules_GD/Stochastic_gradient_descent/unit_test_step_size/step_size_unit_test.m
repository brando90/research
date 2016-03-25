addpath('..');
addpath('../../../model_functions');
%% data
x = (1:3)'/norm(1:3, 2);
c = [17:20;21:24;25:28]';
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]';
dV_dc = rand(1)*c;
beta = 1;
y = 2*(1:3)'/norm(1:3, 2);
%% check step size consistency
eta_c_line_search = choose_step_size_c_stochastic(x,y, c,t,beta, dV_dc)
[f_x, ~, a] = f(x, c, t, beta);
eta_c_optimal = choose_step_size_c_stochastic_closed_soln(f_x, a, dV_dc, y)