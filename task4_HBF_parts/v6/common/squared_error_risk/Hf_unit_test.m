%% HF unit test
restoredefaultpath
addpath('../../one_1_layer_HBF_autoencoder/HBF1');
addpath('../../one_1_layer_HBF_autoencoder/HBF1/model_functions');
%%
X = [1:3;3:5;5:7]';
X = normc(X)
Y = [8:10;10:12;12:14]';
Y = normc(Y)
c = [17:20;21:24;25:28]'
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]'
beta = 1;
%%
lambda = 0;
disp('Should be: 68895.2')
mdl = HBF1(c,t,beta);
compute_Hf_sq_error(X,Y, mdl, lambda)