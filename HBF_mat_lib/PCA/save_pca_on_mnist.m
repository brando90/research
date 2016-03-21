clear;
vname=@(x) inputname(1);
%% do PCA on MNIST
data_set_path = '../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
%% get data set
data_normalized = 0
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
%% PCA from data set
[coeff, score, latent, tsquared, explained, mu] = pca(X_train');
pca_MNIS_location = './MNIST_PCA_small';
save(pca_MNIS_location, vname(coeff), vname(mu) );
% pca_MNIS_location = './MNIST_PCA_big';
% save(pca_MNIS_location, vname(coeff), vname(score), vname(latent), vname(tsquared), vname(explained), vname(mu) );