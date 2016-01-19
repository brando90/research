function [ distances ] = get_dt_dt( t_prev, t_new )
%get_dt_dt, gets the changes in the parameters as the iterations changes
[~, K] = size(t_prev);
distances = zeros([K,1]);
for k=1:K
    t_prev_k = t_prev(:,k);
    t_new_k = t_new(:,k);
    distances(k) = norm(t_prev_k - t_new_k,2)^2;
end
end