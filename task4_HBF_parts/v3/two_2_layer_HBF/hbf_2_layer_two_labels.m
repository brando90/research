disp('-------------------------->>> Running simulations 2 layer HBF...');
%% Create vectors to learn from
addpath('../common')
N = 8;
D = 4;
Dp = D/2;
Dd =3;
[X, y] = generate_supervised_classification_hbf2_2_labels(N, D, Dp);
disp('---> Size(X) = (D, N)');
disp(size(X));
disp('---> Size(y) = (N, 1)')
disp(size(y));
%% Parameters
c = rand(K2, 1);
t2 = rand(Dp, Dd, Np);
t1 = rand(K1, K2);
mu_c = 0.9;
mu_t1 = 0.9;
mu_t2 = 0.9;
prec = 0.5;
visualize = 1;
%% Learn the parameters
[c, t_1, t_2] = learn_HBF_parameters_2_hidden_layer(X,y,c,t_1,t_2,lambda,mu_c,mu_t1,mu_t2, prec, visualize);
%% Print some results
disp(c);
disp(t_1);
disp(t_2);