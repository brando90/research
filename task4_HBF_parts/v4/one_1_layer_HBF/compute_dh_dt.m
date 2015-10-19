function [ dh_dt ] = compute_dh_dt(z,x,t,c_l)
%update df_dt
%   Input:
%       z = (K x 1)
%       x = data (D x 1)
%       t = (D x K)
%       c_l = weights (K x 1)
%   Output:
%       dh_dt = (D x K)
[D, K] = size(t);
X = repmat(x, 1, K); %(D x K)
% z = zeros(K, 1);
% for k=1:K
%     z(k) = norm(x-t(:,k),2)^2;
% end
b_k = c_l'.*exp(-z'); %(1 x K)
B = repmat(b_k, D, 1); %(D x K)
dh_dt = -2*B.*(X - t);
end