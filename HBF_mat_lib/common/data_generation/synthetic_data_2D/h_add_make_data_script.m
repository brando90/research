%% create data from range
start_val = -1;
end_val = 1;
sqrtN = 50; %N = sqrtN*sqrtN
x_range = linspace(start_val, end_val, sqrtN);
y_range = linspace(start_val, end_val, sqrtN);
%% make meshgrid
[X,Y] = meshgrid(x_range, y_range);
Z = sin(2*pi*X) + 4*(Y - 0.5).^2; %% h_add
surf(X,Y,Z);
%% create data set for training alg 
[ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z );
%% make the data back to mesh from training data
[Xp,Yp,Zp] = make_meshgrid_data_from_training_data( X_data,Y_data );
figure
surf(Xp,Yp,Zp);