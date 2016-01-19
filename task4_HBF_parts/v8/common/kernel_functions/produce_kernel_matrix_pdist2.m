function [ K ] = produce_kernel_matrix_pdist2( X,t, beta )
%   Inputs:
%       X = (D x N)
%       X = (D x K)
%       beta = precision (1 x 1)
%   Outputs:
%       K = (N x K)
X = X';
t = t';
D = pdist2(X, t); % (N x K)
K = exp(-beta*D.^2); % (N x K)
end

