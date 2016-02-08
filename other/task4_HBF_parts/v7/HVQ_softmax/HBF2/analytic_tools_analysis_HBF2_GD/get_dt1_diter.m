function [ distances ] = get_dt1_dt( t1_prev, t1_new )
%Computes the change in the first later centers  t1 wrt to one interation
%   Input:
%       t1_prev = old t1 centers (Dp x Dd x Np)
%       t1_new = new t1 centers (Dp x Dd x Np)
%   Output:
%       distances = distances btw old and new t1s' (Dd x Np)
[~, Dd, Np] = size(t1_prev);
distances = zeros([Dd,Np]);
for np=1:Np
    for dd=1:Dd
        t1_prev_dd_np = t1_prev(:,dd,np);
        t1_new_dd_np = t1_new(:,dd,np);
        distances(dd,np) = norm(t1_prev_dd_np- t1_new_dd_np ,2)^2;
    end
end
%distances = reshape(distances, Dd*Np, 1);
end