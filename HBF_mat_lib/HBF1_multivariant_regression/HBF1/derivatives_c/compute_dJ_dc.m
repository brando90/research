function [ dJ_dc ] = compute_dJ_dc( f_x,y,a )
%Computes dJ_dc
%   Input:
%       f_x = h's (D x 1)
%       y = label (1 x 1)
%       a = activations (K x 1)
%   Output:
%       dJ_dc = (K x D)

% L = length(h_x);
% K = length(a);
% dh_dc = compute_dh_dc(a,L); %(K x L)
% dJ_dh = compute_dJ_dh(h_x,y,K); %(K x L)
% dJ_dc = -dJ_dh.*dh_dc; %(K x L)

dJ_dc = compute_dJ_dc_loops(f_x,y,a);
end