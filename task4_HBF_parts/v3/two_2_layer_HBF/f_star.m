function [ f ] = f_star( x, c, t_1, t_2, Np, Dp )
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
x_parts = reshape(x, [Dp, Np])'; % Np x Dp
t_1_perm = permute(t_1, [2,1,3]); % Dd x Dp x Np
[~, Dd, ~] = size(t_1);
a = zeros([Np, Dd]); % Np x Dd
for np=1:Np
    x_np = x_parts(np,:); %1 x Dp
    a_np = exp(-1 * pdist2(x_np, t_1_perm(:,:, np))); % 1 x Dd
    a(np, :) = a_np;
end
a = a'; % Dd x Nd
K1 = Np * Dd;
a = reshape(a, [K1, 1])';
a_l3 = exp( -1 * pdist2(a, t_2'));
f = dot(a_l3, c);
end