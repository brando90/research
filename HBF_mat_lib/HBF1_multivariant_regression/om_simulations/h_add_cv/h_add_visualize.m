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
start_val = -1;
end_val = 1;
sqrtN = 50; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
fprintf('N = %d\n',N);
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
%% make meshgrid
[X,Y] = meshgrid(x_range, y_range);
Z = sin(2*pi*X) + 4*(Y - 0.5).^2; %% h_add
figure
surf(X,Y,Z);
title('Original Data set')
%% create data set for training alg 
[ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
%% predict
eta_c = 0.01;
eta_t = 0.01;
lambda = 0;
gau_precision = 0.1;
D_out = 1;
visualize = 0;
sgd_errors = 0;
iterations = 10*N;
center = 2500
K = center;
%c_init = normc(rand(K,D_out)); % (N x D)
c_init = rand(K,D_out); % (N x D)
t_init = datasample(X_data', K, 'Replace', false)'; % (D x N)
mdl_params = HBF1_parameters(c_init,t_init,gau_precision,lambda);
tic;
[mdl_params, ~, ~] = learn_HBF1_SGD( X_data, Y_data', mdl_params, iterations,visualize, X_data,Y_data, eta_c,eta_t, sgd_errors);
time_passed = toc;
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed )
mdl_current = HBF1( mdl_params );
F_data = mdl_current.predict_data_set(X_data)';
size(F_data);
%% make the data back to mesh from training data
[Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,F_data );
figure
surf(Xp,Yp,Zp);
title('Reconstructed function')