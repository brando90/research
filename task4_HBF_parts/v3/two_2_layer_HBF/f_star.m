function [ f, z_l1, z_l2, a_l2, a_l3 ] = f_star( x, c, t_1, t_2, Np, Dp )
%f_start - computes 2 layer HBF predictor
%   Computes f^*(x) = sum_i c_i a^(3)_i
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x 1)
%       t_2 = centers (K1 x K2)
%       t_1 = centers (Dp x Dd x Np)
%   Outputs:
%       f = f^*(x) = sum_i c_i a^(3)_i
%       a_l3 = activations l3 (K2 x 1)
%       z_l2 = inputs l2 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       z_l1 = inputs l1 (Np x Dd)
x_parts = reshape(x, [Dp, Np])'; % Np x Dp
t_1_perm = permute(t_1, [2,1,3]); % Dd x Dp x Np
[~, Dd, ~] = size(t_1);
a_l2 = zeros([Np, Dd]); % Np x Dd
z_l1 = zeros([Np, Dd]); % Np x Dd
for np=1:Np
    x_np = x_parts(np,:); %1 x Dp
    z_l1_np = pdist2(x_np, t_1_perm(:,:, np)); % 1 x Dd
    z_l1(np, :) = z_l1_np; % 1 x Dd
    a_l2_np = exp(-1 * z_l1_np ); % 1 x Dd
    a_l2(np, :) = a_l2_np;
end
%a_l2 = a_l2'; % Dd x Nd
K1 = Np * Dd;
a_l2_k1 = reshape(a_l2', [K1, 1])'; %1 x K1
z_l2 = pdist2(a_l2_k1, t_2'); %1 x K2
a_l3 = exp( -1 * z_l2)'; %K2  x 1
z_l2 = z_l2';
f = dot(a_l3, c);
end