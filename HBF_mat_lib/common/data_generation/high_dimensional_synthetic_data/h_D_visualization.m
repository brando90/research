%% Load paths
restoredefaultpath
clear;
addpath('../../cross_validation/standard_train_cv_test_validation')
addpath('../../')
%% get random vectors in a hypercube
start_val = -3;
end_val = 3;
sqrtN = 200; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
D = 10
X_data = (end_val - start_val) * rand(D,N) + start_val;
Z = zeros(1,N); %% sin(||x||^2)||x||^2
for n=1:N
    x = X_data(:,n);
    Z(1,n) = norm(x,2)^2 * sin( norm(x,2)^2 );
end
Y_data = Z;
%% visualize data
% x_axis = zeros(1,N);
% for n=1:N
%     x = X_data(:,n);
%     x_axis(:,n) = norm(x,2)^2;
% end
% x_axis = sort(x_axis);
% y_plot = zeros(1,N);
% for n=1:N
%     x = x_axis(:,n);
%     y_plot(1,n) = x^2 * sin( x^2 );
% end
% figure
% plot(x_axis, y_plot)
% x_axis = linspace(0,30,N);
% figure
% plot(x_axis, x_axis.^2 .* sin(x_axis.^2) )
%% suffle data
[X_data, Y_data] = cross_validation_data.shuffle_data(X_data,Y_data);
%% divide data for CV
per_train = 0.7;
per_cv = 0.15;
data4cv = cross_validation_data(X_data,Y_data,per_train,per_cv);

[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[~,Ntrain] = size(X_train)
[~,Ncv] = size(X_cv)
[~,Ntest] = size(X_test)

name_file = sprintf('../../data/data_h_D%d_x2sinx_%g_%g_%g_%d_%d_%d.mat',D,per_train,per_cv,1-per_cv-per_train,Ntrain,Ncv,Ntest);
save( name_file,'data4cv');