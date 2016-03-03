addpath('../../HBF1');
addpath('../../HBF1/model_functions');
addpath('../../HBF1/update_rules_GD/Stochastic_gracient_descent');
addpath('../../HBF1/derivatives_c');
addpath('../../HBF1/derivatives_t');
addpath('../../../common/squared_error_risk');
addpath('../../../common/visualize_centers')
addpath('../../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../../common')
addpath('../../../common/MNIST')
addpath('../../../common/kernel_functions')
addpath('../../../RBF_multivariant_regression/RBF');
addpath('../../../common/data_generation/synthetic_data_2D')
%% create data from range
% start_val = -6;
% end_val = 6;
% sqrtN = 200; %N = sqrtN*sqrtN
% N = sqrtN*sqrtN
start_val = -3;
end_val = 3;
sqrtN = 200; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
fprintf('N = %d\n',N);
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
%% make meshgrid
[X,Y] = meshgrid(x_range, y_range);
Z = sin(X .* Y); %% sinBxy
figure
surf(X,Y,Z);
title('Original Data set')
%% create data set for training alg 
[ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
%% predict
% load('./rbf_real');
% F_data = rbf_real_mdl.predict_data_set(X_data)';
% [D, center] = size(best_iteration_mdl.t)
% size(F_data);
%%
load('./results/r_18feb_d1/test_error_vs_iterations1.mat')
[D, centers] = size(best_iteration_mdl.t)
F_data = best_iteration_mdl.predict_data_set(X_data)';
size(F_data);
%% make the data back to mesh from training data
[Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,F_data' );
figure
surf(Xp,Yp,Zp);
title(sprintf('Reconstructed function, number of centers = %d',center))