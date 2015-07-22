function [ Y ] = f_star_all_data( X, C, t)
[~, N] = size(X);
f_1 = f_star(x_1, C, t);
D_p = length(f_1);
Y = zeros(D_p, N);
for i=2:N;
    x_i = X(i);
    [f_i, ~] = f_star(x_i, C, t);
    Y(:,i) = f_i;
end
end

