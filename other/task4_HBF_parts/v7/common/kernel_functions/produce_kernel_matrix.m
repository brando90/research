function [ Kern ] = produce_kernel_matrix( X, t, beta )
%   Inputs:
%       X = (D x N)
%       beta = precision (1 x 1)
%   Outputs:
%       K = (N x K)
Kern = produce_kernel_matrix_bsxfun( X, t, beta );
end

