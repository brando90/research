function [ Y ] = f_star_all_data( X, C, t)
[~, N] = size(X);
x_1 = X(:,1);
disp('dimension of x_1')
size(x_1)
disp('size C')
size(C)
f_1 = f_star(x_1, C, t);
disp('f1 dimension')
size(f_1)
D_p = length(f_1);
Y = zeros(D_p, N);
for i=2:N;
    x_i = X(:,i);
    size(x_i);
    [f_i, ~] = f_star(x_i, C, t);
    Y(:,i) = f_i;
end
end

