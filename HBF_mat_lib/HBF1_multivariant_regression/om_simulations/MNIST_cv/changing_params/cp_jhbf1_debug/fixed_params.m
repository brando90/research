gau_precision = 0.5;
num_inits = 3;
iterations = 500; %original 1500
train_func = @learn_HBF_SGD;
mdl_func = @HBF1;
lambda = 0;
