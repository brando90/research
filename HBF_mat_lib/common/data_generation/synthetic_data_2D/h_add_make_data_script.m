%%
start = -3;
step = 0.1;
end_point = 3;
x_range = start:step:end_point;
y_range = start:step:end_point;
[X,Y] = meshgrid(x_range, y_range);
Z = sin(2*pi*X) + 4*(Y - 0.5).^2;
surf(X,Y,Z);