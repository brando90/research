%% Load paths
restoredefaultpath
clear;
addpath('../../cross_validation/standard_train_cv_test_validation')
addpath('../../')
%% make mesh grid data
start_val = -3;
end_val = 3;
sqrtN = 200; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
[X,Y] = meshgrid(x_range, y_range);
Z = ((X.^2 + Y.^2).^(-1) ) .* sin(X .* Y); %% sinBxy
%%%following code will plot meshgrid data
figure
surf(X,Y,Z)
%% make the entire data set from the meshgrid data
[X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
[X_data, Y_data] = cross_validation_data.shuffle_data(X_data,Y_data);
%this will plot nonsense
%figure
%surf(Xp,Yp,Zp);
%% divide data for CV
per_train = 0.7;
per_cv = 0.15;
data4cv = cross_validation_data(X_data,Y_data,per_train,per_cv);

[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[~,Ntrain] = size(X_train)
[~,Ncv] = size(X_cv)
[~,Ntest] = size(X_test)

name_file = sprintf('../../data/data_h_1_x2_y2_sinxy_%g_%g_%g_%d_%d_%d.mat',per_train,per_cv,1-per_cv-per_train,Ntrain,Ncv,Ntest);
save( name_file,'data4cv');