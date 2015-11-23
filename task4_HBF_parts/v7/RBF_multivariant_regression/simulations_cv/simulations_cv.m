disp('-------------------------->>> RBF...');
%% Load paths
restoredefaultpath
clear
addpath('../RBF');
addpath('../RBF/model_functions');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../common/MNIST')
X = magic(5);
v = (1:5)';
theta = v/norm(v,2);
y = X*theta;


train_func = @learn_RBF_linear_algebra;
[ best_mdl, error_best_mdl] = split_cross_validation(mdl, X,y, per_train,per_cv, beta_start,beta_step,beta_end, train_func,num_initilizations);