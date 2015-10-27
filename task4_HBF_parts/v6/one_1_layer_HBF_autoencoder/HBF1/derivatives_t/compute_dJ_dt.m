function [ dJ_dt ] = compute_dJ_dt(f_x,z,x,y,t,c)
%Computes dJ_dc
%   Input:
%       z = (K x 1)
%       x = data point (D, 1)
%       y = labels (1 x 1)
%       t = centers (D x K)
%       c = weights (K x D)
%   Output:
%       dJ_dc = (D x K)
dJ_df = compute_dJ_df(f_x, y); %(D x K)
df_dt = compute_df_dt(z,x,t,c_l); %(D x K)
dJ_dt = dJ_df .* df_dt; %(D x K)
end