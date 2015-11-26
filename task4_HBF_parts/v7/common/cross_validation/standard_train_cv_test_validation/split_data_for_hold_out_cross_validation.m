function [ X_train,X_cv,X_test, y_train,y_cv,y_test ] = split_data_for_hold_out_cross_validation(X,y,per_train,per_cv)
[~, N] = size(X);
N_train = floor(N * per_train);
N_cv = floor(N * per_cv);
%N_test = N - N_train - N_cv;
%%data sets
X_train = X(:,1:N_train);
X_cv = X(:, N_train+1:N_train+N_cv );
X_test = X(:, N_train+N_cv+1:N);
y_train = y(:,1:N_train);
y_cv = y(:, N_train+1:N_train+N_cv );
y_test = y(:, N_train+N_cv+1:N);
end