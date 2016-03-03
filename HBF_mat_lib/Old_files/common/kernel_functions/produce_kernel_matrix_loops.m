function [ Kdata ] = produce_kernel_matrix_loops( X, t, beta)
%   Inputs:
%       X = (D x N)
%       t = (D x K)
%   Outputs:
%       K = (N x K)
[~, N] = size(X);
[~, K] = size(t);
Kdata = zeros(N, K);
for n=1:N
    x_n = X(:,n);
    for j=1:K
        z_nj = norm(x_n - t(:,j),2)^2;
        Kdata(n,j) = exp(-beta * z_nj);
    end
end
end

