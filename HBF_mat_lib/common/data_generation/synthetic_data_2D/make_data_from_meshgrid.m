function [ X_data,Y_data] = make_data_from_meshgrid( X,Y,Z )
% want to make data set as:
%   ( x = [x1, x2], z = f(x,y) )
%   X = [D, N], Z = [Dout, N] = [1, N]
[dim_x, dim_y] = size(X);
N = dim_x * dim_y;
X_data = zeros(2,N);
Y_data = zeros(1,N);
i = 1;
for dx = 1:dim_x
    for dy = 1:dim_y
        x = X(dx, dy);
        y = Y(dx, dy);
        x_data = [x;y];
        y_data = Z(dx, dy);
        X_data(:,i) = x_data;
        Y_data(:,i) = y_data; %dont do y(:,i)
        i=i+1;
    end
end
end