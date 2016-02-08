function [ X, Y ] = generate_high_dim_regression( N, D, D_out, snr )
%
X = rand(D, N);
Y = zeros(D_out,N);
for i=1:N
    xi = X(:,i);
    t = norm(xi, 2)^2;
    yi = sin(3*t) + (1/3)*cos(4*t);
    Y(:,i) = awgn(yi,snr) + 0.5*(1:D_out)';
end
end