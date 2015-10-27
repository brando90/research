function [ dh_dt ] = compute_dh_dt_z_forward_pass( z,x,t,c_l )
%update dh_dt
%   Input:
%       z = (K x 1)
%       x = data (D x 1)
%       t = (D x K)
%       c_l = weights (K x 1)
%   Output:
%       dh_dt = (D x K)
[D, K] = size(t);
dh_dt = zeros(D, K);
for k=1:K
    c_l_k = c_l(k);
    t_k = t(:,k);
    z_k = z(k);
    dh_dt(:,k) = c_l_k*(-exp(-z_k))*2*(x-t_k);
end
end