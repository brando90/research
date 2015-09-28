function [ z_l1_p, z_l2_p, a_l2, a_l3 ] = forward_pass( x, c, t1, t2, sig )
% computes z1 to al3 of the lower layers of the foward pass
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       f = f^*(x) = sum_i c_i a^(3)_i
%       z_l2_p = inputs l2 (K2 x 1)
%       z_l1_p = inputs l1 (Np x Dd)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
[Dp, Dd, Np] = size(t1);
z_l1_p = zeros(Np, Dd);
a_l2 = zeros(Np, Dd);
x_parts = reshape(x, [Dp, Np]);
%% Compute components of 1st layer z'_l1 and a_l1
for np=1:Np
    x_np = x_parts(:,np);
    t1_np = t1(:,:, np);
    for dd=1:Dd
        t1_np_dd = t1_np(:, dd);
        z_l1_np_dd = norm(t1_np_dd - x_np, 2)^2;
        z_l1_np_dd_p = sig * z_l1_np_dd;
        a_l1_np_dd = exp(-z_l1_np_dd_p);
%         a_l1_np_dd = -z_l1_np_dd;
%         a_l1_np_dd = sin(-z_l1_np_dd);
        % insert
        a_l2(np, dd) = a_l1_np_dd;
        z_l1_p(np, dd) = z_l1_np_dd_p;
    end
end
%% Compute components of 2nd layer z'_l2 and a_l2
K1 = Dd*Np;
[K2, ~] = size(c);
a_l2_vec = reshape(a_l2', [K1,1]);
z_l2_p = zeros(K2, 1);
for k2=1:K2
    t2_k2 = t2(:, k2); % K2 x 1
    z_l2_k2 = norm(t2_k2 - a_l2_vec, 2)^2;
    z_l2_k2_p = sig * z_l2_k2;
    % insert
    z_l2_p(k2) = z_l2_k2_p;
end
%% Output layer 3rd layer
a_l3 = exp(-z_l2_p);
%f = c' * a_l3; if it were to output f
end

