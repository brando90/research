function [ dJ_dt1_col_norms ] = get_norms_col_dJ_dt1( dJ_dt1 )
%Computes the change in the first later centers  t1 wrt to one interation
%   Input:
%       dJ_t1 = old t1 centers (Dp x Dd x Np)
%   Output:
%       distances = distances btw old and new t1s' (Dd x Np)
[~, Dd, Np] = size(dJ_dt1);
dJ_dt1_col_norms = zeros([Dd,Np]);
for np=1:Np
    for dd=1:Dd
        dJ_dt1_dd_np = dJ_dt1(dd,np);
        dJ_dt1_col_norms(dd,np) = norm(dJ_dt1_dd_np ,2)^2;
    end
end
%distances = reshape(distances, Dd*Np, 1);
end