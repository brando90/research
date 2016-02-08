function [ dJ_dt ] = compute_dJ_dt_vec(h_x,z,x,y,t,c)
%Computes dJ_dc
%   Input:
%       z = (K x 1)
%       x = data point (D, 1)
%       y = labels (1 x 1)
%       t = centers (D x K)
%       c = weights (K x L)
%   Output:
%       dJ_dc = (D x K)
[D,K] = size(t);
[~, L] = size(c);
dJ_dt = zeros(D, K);
for l=1:L
    c_l = c(:,l);
    dh_dt = compute_dh_dt(z,x,t,c_l); %(D x K)
    ind_y_l = (y==l);
    prob_y_x_h_x = prob_y_x(h_x); % (L x 1)
    dJ_dh = repmat( ind_y_l - prob_y_x_h_x(l) , D, K); %(D x K)
    dJ_dt = dJ_dt + dJ_dh.*dh_dt;
end
dJ_dt = -dJ_dt;
end