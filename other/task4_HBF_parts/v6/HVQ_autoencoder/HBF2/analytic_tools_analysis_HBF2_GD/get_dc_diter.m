function [ deltas_c ] = get_dc_dt( c_prev, c_new )
%Computes the change in the first later centers  t1 wrt to one interation
%   Input:
%       c_prev = old c weights (K2 x L)
%       c_new = new c weights (K2 x L)
%   Output:
%       distances = distances btw old and new cs' (L x 1)
[~, L] = size(c_prev);
deltas_c = zeros([L,1]);
for l=1:L
    c_prev_l = c_prev(:,l);
    c_new_l = c_new(:,l);
    deltas_c(l) = norm(c_prev_l - c_new_l,2)^2;
end
end