function [ dJ_df ] = compute_dJ_df(f_x, y)
%Computes dJ_dc
%   Input:
%       f_x = reconstruction (D x 1)
%       y = labels (D x 1)
%   Output:
%       dJ_df = (D x K)
delta = 2*(y - f_x); % (D x 1)
dJ_df = repmat(delta, 1, K); % (D x K)
end