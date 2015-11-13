function [ dHf_dt_col_norms ] = get_norms_col_dHf_dt( dHf_dt )
% Get norms of each column of dJ_dt2
%   Input:
%   Output:
[~, K] = size(dHf_dt);
dHf_dt_col_norms = zeros(K, 1);
for k=1:K
    dHf_dt_col = dHf_dt(:, k);
    dHf_dt_col_norms(k) = norm(dHf_dt_col, 2).^2;
end
end