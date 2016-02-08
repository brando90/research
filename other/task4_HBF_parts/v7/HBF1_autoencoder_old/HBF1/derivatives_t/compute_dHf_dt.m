function [ dHf_dt ] = compute_dHf_dt(X,y, c,t,beta, lambda)
%Computes dHf_dc
%   Input:
%       X = data (D x N)
%       y = input (D x N)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%   Output:
%       dHf_dt = derivative (D x K)
[K, ~] =size(c);
[D, N] = size(X);
dHf_dt = zeros(D,K);
for i=1:N
    x_i = X(:,i);
    y_i = y(:,i);
    [f_x, z, ~] = f(x_i,c,t,beta);
    dJ_dt = compute_dJ_dt(f_x,z,x_i,y_i,t,c); %(D x K)
    dHf_dt = dHf_dt + dJ_dt;
end
regularization_term = 0; %TODO
dHf_dt = dHf_dt + lambda * regularization_term;
end