function [ dJ_df ] = compute_dJ_df(f,y,K2)
%computes 1{y==l} - p(y=l|x;theta)
%   Input:
%       f = f's (L x 1)
%       y = labels (1 x 1)
%   Output:
%       dJ_df = dJ_df (K2 x L) 
L = length(f);
ind_y_l = ((1:L) == y); %(1 x L)
ind_y_l_M = repmat(ind_y_l, K2, 1); %(K2 x L)
prob = prob_y_x(f); %(L x 1)
prob_M = repmat(prob', K2, 1); %(K2 x L)
delta = ind_y_l_M - prob_M;
dJ_df = delta;
end

