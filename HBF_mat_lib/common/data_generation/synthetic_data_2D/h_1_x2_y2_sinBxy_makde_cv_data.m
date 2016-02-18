%% create data from range
start_val = -3;
end_val = 3;
sqrtN = 200; %N = sqrtN*sqrtN
N = sqrtN*sqrtN
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
%% make meshgrid
[X,Y] = meshgrid(x_range, y_range);
Z = sin(X .* Y); %% sinBxy
figure
surf(X,Y,Z);
%% create data set for training alg 
[ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
[D, N] = size(X_data);
perm = randperm(N);
X_data = X_data(:, perm);
Y_data = Y_data(:,perm);
% figure
% scatter3(X_data(1,:),X_data(2,:),Y_data)
%X_data(:, perm) = X_data;
%Y_data(:,perm) = Y_data;
%% make the data back to mesh from training data
[Xp,Yp,Zp] = make_meshgrid_data_from_training_data( data4cv.X,Y_data );
figure
surf(Xp,Yp,Zp);