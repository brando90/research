function [ dJ_dc ] = compute_dJ_dc_loops( f_x,y,a )
%Computes dJ_dc
%   Input:
%       f_x = f's (D x 1)
%       y = label (1 x 1)
%       a = activations (K x 1)
%   Output:
%       dJ_dc = (K x D)
D = length(f_x);
K = length(a);
dJ_dc = zeros([K, D]);
for d=1:D
    dJ_df_d = 2*(y(d) - f_x(d)); % (1 x 1)
    df_d_dc_d = a; % (K x 1)
    dJ_dc(:,d) = dJ_df_d * df_d_dc_d; % (K x 1)
end
end