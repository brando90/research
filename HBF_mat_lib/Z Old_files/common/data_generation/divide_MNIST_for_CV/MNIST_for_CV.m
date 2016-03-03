%% Load paths
restoredefaultpath
clear;
addpath('../../cross_validation/standard_train_cv_test_validation')
addpath('../../')
addpath('../../MNIST')
load('../../data/all_MNIST_Combine.mat');
%% divide data for CV
per_train = 0.7;
per_cv = 0.15;
data4cv = cross_validation_data(X,Y,per_train,per_cv);

% num_labels = 10;
% amount_per_label = 123;
% [X_train, y_train] = get_balanced_data_set( data4cv.X_train, data4cv.y_train, amount_per_label, num_labels );
% [X_cv, y_cv] = get_balanced_data_set( data4cv.X_cv, data4cv.y_cv, amount_per_label, num_labels );
% [X_test, y_test] = get_balanced_data_set( data4cv.X_test, data4cv.y_test, amount_per_label, num_labels );

[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();

% [X_train, y_train] = cross_validation_data.shuffle_data(X_train,y_train);
% [X_cv, y_cv] = cross_validation_data.shuffle_data(X_cv, y_cv);
% [X_test, y_test] = cross_validation_data.shuffle_data(X_test, y_test);
data4cv.change_data_sets(X_train,X_cv,X_test, X_train,X_cv,X_test)

[~,Ntrain] = size(X_train)
[~,Ncv] = size(X_cv)
[~,Ntest] = size(X_test)

name_file = sprintf('../../data/data_MNIST_%g_%g_%g_%d_%d_%d.mat',per_train,per_cv,1-per_cv-per_train,Ntrain,Ncv,Ntest);
%name_file = sprintf('../../data/data_MNIST_data4CV_%d.mat',num_labels*amount_per_label);
%name_file = strcat('../../data/data_MNIST_data4CV_' ,strcat(num2str(num_labels*amount_per_label),'.mat') );
%save( name_file,'X','Y','X_train','X_cv','X_test','y_train','y_cv','y_test','data4cv');
save( name_file,'data4cv');
data4cv.normalize_data();