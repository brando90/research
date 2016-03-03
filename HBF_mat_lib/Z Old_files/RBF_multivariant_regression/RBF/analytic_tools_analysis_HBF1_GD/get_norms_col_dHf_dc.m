function [ dJ_dc_col_norms ] = get_norms_col_dHf_dc( dJ_c )
% Get norms of each column of dJ_dt2
%   Input:
%       dJ_dc = derivative of training error wrt c (K2 x L)
%   Output:
%       dJ_dc_col_norms = || dJ_dc ||^2 (L x 1)
[~, L] = size(dJ_c);
dJ_dc_col_norms = zeros(L, 1);
for l=1:L
    dJ_dc_col = dJ_c(:, l);
    dJ_dc_col_norms(l) = norm(dJ_dc_col, 2).^2;
end
end