function [ dJ_dt ] = compute_dJ_dt(f_x,z,x,y,t,c)
%Computes dJ_dc
%   Input:
%       z = (K x 1)
%       x = data point (D, 1)
%       y = labels (1 x 1)
%       t = centers (D x K)
%       c = weights (K x D)
%   Output:
%       dJ_dt = (D x K)
% [D,K] = size(t);
% dJ_dt = zeros(D,K);
% %dJ_df = compute_dJ_df(f_x, y); %(D x 1)
% for k=1:K
%    for d=1:D
%         c_d = c(:,d);
%         dJ_df_d = dJ_df(d); % (1 x 1)
%         df_dt = compute_df_dt(z,x,t,c_d); %(D x 1)
%         dJ_dt(:,k) = dJ_df_d * df_dt(d);
%     end 
% end
% for d=1:D
%     c_d = c(:,d);
%     dJ_df_d = dJ_df(d);
%     df_dt = compute_df_dt(z,x,t,c_d); %(D x K)
%     dJ_dt = dJ_df .* df_dt; %(D x K)
% end
dJ_dt = compute_dJ_dt_loops(f_x,z,x,y,t,c);
end