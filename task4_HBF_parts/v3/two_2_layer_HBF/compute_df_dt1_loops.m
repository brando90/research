function [ dJ_dt1 ] = compute_df_dt1_loops(t1,x,z_l1,z_l2,a_l2,c,t2)
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
[Dp, ~, ~] = size(t1); %(Dp x Dd x Np)
[Np, Dd] = size(a_l2);
K2 = length(c);
t2_tensor = reshape(t2, Dd, Np, K2);
x_parts = reshape(x, [Dp, Np]);
dJ_dt1 = zeros(Dp, Dd, Np);
for i=1:Dd
    xi = x_parts(:,i);
    for j=1:Np
        t_l1_ij = t1(:,i,j);
        a_l2_ij = a_l2(j, i);
        z_l1_ij = z_l1(j,i);
        alpha_ij = 0;
        for k2=1:K2
            t2_k2ij = t2_tensor(i,j,k2);
            c_k2 = c(k2);
            z_l2_k2 = z_l2(k2);
            new_delta = c_k2*-1*exp(-z_l2_k2)*2*(a_l2_ij - t2_k2ij);
            alpha_ij = alpha_ij + new_delta;
        end
        alpha_ij = alpha_ij*exp(-z_l1_ij)*2*(xi - t_l1_ij);
        dJ_dt1(:,i,j) = alpha_ij;
    end
end
end