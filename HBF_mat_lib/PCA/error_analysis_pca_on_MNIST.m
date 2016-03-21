clear;
%% params
data_set_path = '../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
jobs = 20
start_centers = 1
end_centers = 250
%% get data set
data_normalized = 0
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[~, N] = size(X_train);
tic;
%% PCA from data set
load('MNIST_PCA.mat')
% [ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
% %% PCA from data set
% [coeff, score, latent, tsquared, explained, mu] = pca(X_train');
% pca_MNIS_location = './MNIST_PCA_small';
% save(pca_MNIS_location, vname(coeff), vname(mu) );
%% Reconstruct data
centers = floor( linspace(start_centers, end_centers, jobs) )
for K=centers
    U = coeff(:,1:K);
    X_tilde_U = U * U'*X_train;
    reconstruction_error = (1/N)*norm( X_tilde_U - X_train ,'fro')^2
end
elapsed_time = toc