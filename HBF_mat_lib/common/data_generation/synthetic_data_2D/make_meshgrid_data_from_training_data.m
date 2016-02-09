function [ X,Y,Z ] = make_meshgrid_data_from_training_data( X_data,Y_data )
[~, N] = size(X_data);
sqrtN = sqrt(N);
dim_y = sqrtN;
dim_x = dim_y;
X = zeros(sqrtN,sqrtN);
Y = zeros(sqrtN,sqrtN);
Z = zeros(sqrtN,sqrtN);
i = 1;
for dx = 1:dim_x
    for dy = 1:dim_y
        x_vec = X_data(:,i)
        x = x_vec(1);
        y = x_vec(2);
        z = Y_data(i);
        X(dx,dy) = x;
        Y(dx,dy) = y;
        Z(dx,dy) = z;
        i = i+1;
    end
end
end