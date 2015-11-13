function [ dJ_dt ] = compute_dJ_dt(h_x,z,x,y,t,c)
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
for k=1:K
    dJ_dt_k = zeros(D, 1);
    for l=1:L
        c_l = c(:,l);
        dh_dt_l = compute_dh_dt(z,x,t,c_l); %(D x K)
        prob_y_x_h_x = prob_y_x(h_x); % (L x 1)
        ind_y_l = (y==l);
        delta = ind_y_l - prob_y_x_h_x(l);
        dJ_dt_k = dJ_dt_k + dh_dt_l(:,k) * delta;
    end
    dJ_dt(:,k) = -dJ_dt_k;
end
end