function [ dh_dt_numerical ] = compute_dh_dt_numerical_derivatives( x,c,t,beta, eps )
%compute_dh_dt_numerical_derivatives
%   input:
%       x = data point (D x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       beta = precision (1 x 1)
%       eps = (1 x 1)
[~, L] = size(c);
[D, K] = size(t);
dh_dt_numerical = zeros([D, K, L]);
for l=1:L;
    for k=1:K
        for d=1:D
            e = zeros([D, K]);
            e(d,k) = eps;
            [h_e1, ~, ~] = h(x, c, t+e, beta);
            [h_e2, ~, ~] = h(x, c, t-e, beta);
            numerical_derivative = (h_e1 - h_e2)/(2*eps);
            dh_dt_numerical(d,k,l) = numerical_derivative(l);
        end
    end
end
end