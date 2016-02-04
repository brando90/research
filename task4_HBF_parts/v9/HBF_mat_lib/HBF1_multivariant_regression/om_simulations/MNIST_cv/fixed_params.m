gau_precision = 0.5;
num_inits = 3; %40
iterations = 100; %10500 
train_func = @learn_HBF_SGD;
mdl_func = @HBF1;
lambda = 0;
