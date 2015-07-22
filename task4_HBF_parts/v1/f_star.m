function [ y, G ] = f_star(x, C, t)
%f_star = computes the HBF function for vector values
%   ---> input x = data
%   ---> outputs: y = [...,y_k,...]=[...,C_jG,...]  = (D_p x N)
%   t = [..., t_k, ...] = centers
%   C = weights for output [...,Cj,...] = (K x D_p)
%   by computing:
%   G = [...,G_k,...] = [...,G(||x - t_k ||),...]
[~, K] = size(t);
G=zeros(K,1);
for k=1:K;
    t_k = t(:, k);
    G_k = exp(-1*norm(x - t_k, 2)^2);
    G(k) = G_k;
end
[~, D_p] = size(C);
y=zeros(D_p, 1);
for j=1:D_p;
    C_j = C(:,j);
    y(j) = C_j.'*G;
end
end