addpath('../../../HBF1');
addpath('../../../HBF1/derivatives_c');
addpath('../../../HBF1/derivatives_t');
addpath('../../../HBF1/model_functions');
addpath('../../../HBF1/batch_gradient_descent/update_rules');
addpath('../../../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../../common/classification');
addpath('../../../common/softmax_risk');
%% f star unit test
x = (1:3)'/norm(1:3, 2);
c = [17:20;21:24;25:28]';
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]';
beta = 1;
mdl = HBF1(c,t,beta);
disp('Should be {67.9525, 82.6636, 97.3746}');
f(x,c,t,beta)
mdl.f(x)
mdl.predict(x)