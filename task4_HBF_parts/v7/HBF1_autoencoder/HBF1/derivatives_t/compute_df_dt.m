function [ df_dt ] = compute_df_dt(z,x,t,c_d)
%update dh_dt
%   Input:
%       z = (K x 1)
%       x = data (D x 1)
%       t = (D x K)
%       c_l = weights (K x 1)
%   Output:
%       df_dt = (D x K)

% [D, K] = size(t);
% X = repmat(x, 1, K); %(D x K)
% b_k = c_d'.*exp(-z'); %(1 x K)
% B = repmat(b_k, D, 1); %(D x K)
% df_dt = 2*B.*(X - t);


end