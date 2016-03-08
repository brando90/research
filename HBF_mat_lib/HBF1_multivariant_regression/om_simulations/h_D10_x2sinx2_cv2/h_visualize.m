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
start_val = -2.5;
end_val = 2.5;
sqrtN = 200; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
fprintf('N = %d\n',N);
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
[X,Y] = meshgrid(x_range, y_range);
%% mkdir
dir_name = 'reconstructions/';
mkdir(dir_name);
%% make true function
%Z = exp( -(X.^2+Y.^2) ).*cos(2*pi*(X+Y));
fig = figure
surf(X,Y,Z);
title('Original function')
saveas(fig, sprintf('%sTrue function',dir_name));
%% create data set for training alg 
[ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
%% PLOT Full RBF
load('./rbf_real');
F_data = rbf_real_mdl.predict_data_set(X_data)';
[Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,F_data' );
fig = figure
[D, centers] = size(rbf_real_mdl.t)
surf(Xp,Yp,Zp);
title(sprintf('Full RBF Reconstructed function, number of centers = %d', centers))
saveas(fig, sprintf('%sfull_rbf_reconstruction_%d', dir_name, centers));
%% PLOT HBF1
jobs = 20;
results_dir_name = 'r_5mar_j14' %%<--CHANGE
for job_num=1:jobs
    name = sprintf('./results/%s/test_error_vs_iterations%d.mat', results_dir_name,job_num);
    load(name)
    %mdl_params = best_iteration_mdl.gather();
    %hbf1 = HBF1(mdl_params);
    %F_data = hbf1.predict_data_set(X_data)';
    F_data = best_iteration_mdl.predict_data_set(X_data)';
    size(F_data);
    % make the data back to mesh from training data
    [Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,F_data' );
    fig = figure
    surf(Xp,Yp,Zp);
    title(sprintf('HBF Reconstructed function, number of centers = %d',center))
    saveas(fig, sprintf('%shbf1_reconstruction_%d', dir_name, center));
end
%% PLOT RBF
for job_num=1:jobs
    name = sprintf('./results/%s/test_error_vs_iterations%d.mat', results_dir_name,job_num);
    load(name)
%     mdl_params = rbf_mdl.gather();
%     rbf = RBF(mdl_params);
%     F_data = rbf.predict_data_set(X_data)';
    F_data = rbf_mdl.predict_data_set(X_data)';
    size(F_data);
    % make the data back to mesh from training data
    [Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,F_data' );
    fig = figure
    surf(Xp,Yp,Zp);
    title(sprintf('RBF Reconstructed function, number of centers = %d',center))
    saveas(fig, sprintf('%srbf_reconstruction_%d', dir_name, center));
end
beep;