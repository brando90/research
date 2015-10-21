function [ dJ_dt_numerical ] = compute_dJ_dt_numerical_derivatives(x,y,c,t,beta,eps)
%compute_dJ_dt_numerical_derivative
%   Input:
%       x = data matrix (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       beta = precision (1 x 1)
%       eps = epsilon (1 x 1)
%   Output:
%       dJ_dt_numerical = (D, K)
[D, K] = size(t);
dJ_dt_numerical = zeros(D, K);
for d=1:D
    for k=1:K
        e = zeros([D,K]);
        e(d,k) = eps;
        J_e1 = J(x,y, HBF1(c,t + e, beta));
        J_e2 = J(x,y, HBF1(c,t - e, beta));
        numerical_derivative = (J_e1 - J_e2)/(2*eps);
        dJ_dt_numerical(d,k) = numerical_derivative;
    end
end
end