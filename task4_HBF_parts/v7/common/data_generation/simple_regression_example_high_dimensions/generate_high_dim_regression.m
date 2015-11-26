function [ X, Y ] = generate_high_dim_regression( N, D )
%
X = rand(D, N);
Y = zeros(1,N);
for i=1:N
    xi = X(:,i);
    t = norm(xi, 2)^2;
    yi = sin(3*t) + (1/3)*cos(3*t);
    Y(i) = yi;
end
end