function [ dJ_dt1, tempout ] = compute_t1_gradient_vect_SO(t1,x,z_l1,z_l2,a_l2,c,t2)
%compute_t1_gradient_vect - computes the t1 parameter of a 2 layer HBF
%   Input:
%       t1 = (Dp x Dd x Np)
%       x = (D x 1)
%       z_l1 = (Np x Dd)
%       z_l2 = (K2 x 1)
%       a_l2 = (Np x Dd)
%       c =  (K2 x 1)
%       t2 = (K1 x K2)
%
%       K1=Dd*Np
%        D=Dp*Np
%       Dp,Np,Dd,K2 unique
%
%   Output:
%       dJ_dt1 = gradient (Dp x Dd x Np)
Dp = size(t1,1);
[Np, Dd] = size(a_l2);
K2 = length(c);
t2_tensor = reshape(t2, Dd, Np, K2);  %Dd x Np x K2
x_parts = reshape(x, [Dp, Np]);       %Dp x Np
t1 = permute(t1,[1 3 2]);             %Dp x Np x Dd

a_l2=a_l2'; %Dd x Np <-> j,i
z_l1=z_l1'; %Dd x Np <-> j,i

tempvar_k2 = -4*c.*exp(-z_l2); % K2 x 1

partialsum = bsxfun(@minus,a_l2,t2_tensor); %Dd x Np x K2
partialsum = permute(partialsum,[3 1 2]);   %K2 x Dd x Np
partialsum = squeeze(sum(bsxfun(@times,tempvar_k2,partialsum),1)); %Dd x Np

tempvar_lastterm = bsxfun(@minus,x_parts,t1);         %Dp x Np x Dd
tempvar_lastterm = permute(tempvar_lastterm,[3 2 1]); %Dd x Np x Dp

dJ_dt1 = bsxfun(@times,partialsum.*exp(-z_l1),tempvar_lastterm); %Dd x Np x Dp
tempout=tempvar_lastterm;
dJ_dt1 = permute(dJ_dt1,[3 1 2]); %Dp x Dd x Np
end