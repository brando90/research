function [ dJ_dc ] = compute_dJ_dt(z,x,t,c)
%Computes dJ_dc
%   Input:
%       x = data point (D, 1)
%       y = labels (1 x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%   Output:
%       dJ_dc = (D x K)
dJ_dc = zeros(D, K);
for l=1:L
    c_l = c(:,l);
    dh_dc = compute_dh_dt(z,x,t,c_l); %(D x K)
    dJ_dh = repmat( y==l , D, K); %(D x K)
    dJ_dc = dJ_dc + -dJ_dh.*dh_dc;
end
end