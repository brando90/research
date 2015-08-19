function [ dJ_dt1 ] = compute_df_dt1_loops3(t1,x,z_l1,z_l2,a_l2,c,t2)
%   Computes t1 according to:
%       df/dt1
%   Input:
%       t1 = centers (Dp x Dd x Np)
%       x = data (D x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%   Output:
%       dJ_dt1 = gradeint (Dp x Dd x Np)
[Dp, Dd, Np] = size(t1); %(Dp x Dd x Np)
K2 = length(c);
x_parts = reshape(x, [Dp, Np]);
dJ_dt1 = zeros(Dp, Dd, Np);
for i=1:Np
    xi_part = x_parts(:,i);
    for j=1:Dd
        z_l1_ij = z_l1(i,j);
        a_l2_ij = a_l2(i,j);
        t_l1_ij = t1(:,j,i);
        alpha_ij = 0;
        for k2=1:K2
            ck2 = c(k2);
            t2_k2 = t2(:, k2);
            index = (i-1)*Dd + j;
            t2_k2_ij = t2_k2(index);
            z_l2_k2 = z_l2(k2);
            new_delta = ck2*(exp(-z_l2_k2))*2*(a_l2_ij - t2_k2_ij);
            alpha_ij = alpha_ij + new_delta;
        end
        alpha_ij = -1 * alpha_ij * exp(-z_l1_ij)*2*(xi_part - t_l1_ij);
        dJ_dt1(:,j,i) = alpha_ij;
    end
end