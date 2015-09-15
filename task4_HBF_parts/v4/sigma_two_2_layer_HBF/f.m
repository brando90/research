function [ f_x, z_l1, z_l2, a_l2, a_l3 ] = f( x, c, t1, t2, sig )
%f_start - computes 2 layer HBF predictor
%   Computes f^*(x) = sum_i c_i a^(3)_i
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       f = f^*(x) = sum_i c_i a^(3)_i (L x 1)
%       z_l1 = inputs l1 (Np x Dd x L)
%       z_l2 = inputs l2 (K2 x L)
%       a_l2 = activations l2 (Np x Dd x L)
%       a_l3 = activations l3 (K2 x L)

[~, Dd, Np] = size(t1);
[K2, L] = size(c);
f_x = zeros(L,1);
z_l1 = zeros(Np,Dd,L);
z_l2 = zeros(K2,L);
a_l2 = zeros(Np,Dd,L);
a_l3 = zeros(K2,L);
for l=1:L
    c_l = c(:,l);
    [ f_x_l, z_l1_l, z_l2_l, a_l2_l, a_l3_l ] = f_loops( x, c_l, t1, t2, sig );
    f_x(l) = f_x_l;
    z_l1(:,:,l) = z_l1_l;
    z_l2(:,l) = z_l2_l;
    a_l2(:,:,l) = a_l2_l;
    a_l3(:,:,l) = a_l3_l;
end
end