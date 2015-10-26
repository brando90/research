function [ dJ_dt2_col_norms ] = get_norms_col_dJ_dt2( dJ_dt2 )
% Get norms of each column of dJ_dt2
%   Input:
%       dJ_dt2 = derivative of training error wrt t2 (K1 x K2)
%   Output:
%       dJ_dt2_col_norms = || dJ_dt2 ||^2 (K2 x 1)
[~, K2] = size(dJ_dt2);
dJ_dt2_col_norms = zeros(K2, 1);
for k2=1:K2
    dJ_dt2_col = dJ_dt2(:, k2);
    dJ_dt2_col_norms(k2) = norm(dJ_dt2_col, 2).^2;
end
end