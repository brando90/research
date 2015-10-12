%% prob_x_y unit test
disp('-------------- test 1')
h_x = [1 2 3];
disp('Should be: {0.0900306, 0.244728, 0.665241}')
prob = prob_y_x(h_x);
disp('prob_y_x:')
disp(prob);
%%
disp('-------------- test 2')
% dimensions
Dp = 3;
Np = 4;
Dd = 2;
K2 = 5;
K1 = Dd * Np;
L=3;
% fake data & params
x = (1:Dp*Np)';
y = 1;
c = rand(K2,L);
t1 = rand(Dp, Dd, Np);
t2 = rand(K1, K2);
sig = 1;
%% call f(x)
[h_x, ~, ~, ~, a_l3 ] = h(x, c,t1,t2,sig);
h_x;
prob = prob_y_x(h_x);
disp(prob)