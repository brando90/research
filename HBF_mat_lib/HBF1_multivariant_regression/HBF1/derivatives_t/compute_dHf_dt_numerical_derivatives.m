function [ dHf_dt_numerical ] = compute_dHf_dt_numerical_derivatives(X,y, c,t,beta,lambda, eps)
%compute_dHf_dc_numerical_derivative
%   Input:
%       X = data (D, N)
%       y = label (N x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = reg param (1 x 1)
%       eps = epsilon (1 x 1)
%   Output:
%       dHf_dt_numerical = (D, K)
[D, K] = size(t);
dHf_dt_numerical = zeros(D, K);
for d=1:D
    for k=1:K
        e = zeros([D,K]);
        e(d,k) = eps;
        Hf_e1 = compute_Hf_sq_error(X,y, HBF1(HBF1_parameters(c,t+e,beta,lambda)), lambda );
        Hf_e2 = compute_Hf_sq_error(X,y, HBF1(HBF1_parameters(c,t-e,beta,lambda)), lambda );
        numerical_derivative = (Hf_e1 - Hf_e2)/(2*eps);
        dHf_dt_numerical(d,k) = numerical_derivative;
    end
end
end