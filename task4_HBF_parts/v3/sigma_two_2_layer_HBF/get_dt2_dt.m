function [ distances ] = get_dt2_dt( t2_prev, t2_new )
%Computes the change in the first later centers  t1 wrt to one interation
%   Input:
%       t2_prev = old t2 centers (K1 x K2)
%       t2_new = new t2 centers (K1 x K2)
%   Output:
%       distances = distances btw old and new t2s' (K2 x 1)
[~, K2] = size(t2_prev);
distances = zeros([K2,1]);
for k2=1:K2
    t2_prev_k2 = t2_prev(:,k2);
    t2_new_k2 = t2_new(:,k2);
    distances(k2) = norm(t2_prev_k2 - t2_new_k2,2)^2;
end
end