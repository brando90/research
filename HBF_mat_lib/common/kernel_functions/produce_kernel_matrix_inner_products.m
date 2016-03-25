function [ Kern ] = produce_kernel_matrix_inner_products( X, t, activation_func)
%   Inputs:
%       X = (D x N)
%       t = (D x K)
%   Outputs:
%       Kern = (N x K)
Kern = activation_func(X' * t);
end