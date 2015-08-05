function [ t1 ] = update_t1_gradient_loops(t1,x,y,f,z_l1,z_l2,a_l2,c,t2,lambda,mu_t1,Dp)
%update_t1_gradient - updates the t1 parameter of a 2 layer HBF
%   Updates t1 according to:
%       t1 := t1 - mu_c * dJ/dt1
%   Input:
%       t1 = centers (Dp x Dd x Np)
%       x = data (D x 1)
%       y = label (1 x 1)
%       f = f(x) (1 x 1)
%       z_l1 = inputs l2 (Np x Dd)
%       z_l2 = inputs l1 (K2 x 1)
%       a_l2 = activations l2 (Np x Dd)
%       a_l3 = activations l3 (K2 x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       lambda = reg param (1 x 1)
%       mu_c = step size (1 x 1)
%   Output:
%       t1 = updated weights (K2 x 1)
[Np, Dd] = size(a_l2);
K2 = length(c);
t2_tensor = reshape(t2, Dp, Nd, K2);
dJ_dt1_ij
for i=1:Dd
    for j=1:Np
        z_l1_ij = z_l1(i,j);
        alpha_k2ij = 0;
        for k2=1:K2
            t2_k2ij = t2_tensor(i,j,k2);
            c_k2 = c(k2);
            z_l2_k2 = z_l2(k2);
            alpha_k2ij = alpha_k2ij + t2_k2ij + c_k2 + exp(-1*z_l2_k2);
        end
        
    end
end
%% update
t1 = t1 - mu_t1 * dJ_dt1;
end