function [ y ] = f_star(x, t, C )
%f_star = computes the HBF function for vector values
%   ---> input x = data
%   ---> outputs: y = [...,y_k,...]=[...,C_jG,...]

%   t = [..., t_k, ...] = centers
%   C = weights for output [...,Cj,...]
%   by computing:
%   G = [...,G_k,...] = [...,G(||x - t_k ||),...]
[~, K] = size(t);
G=zeros(K);
for k=1:1:K;
    t_k = t(:,:, k); % 1xD
    G_k = exp(-1*norm(x - t_k,2)^2);
    G(k) = G_k;
end
D_p = size(x);
y=zeros(D_p,1);
for j=1:1:D;
    C_j = C(:,:,j);
    y(j) = C_j*G;
end
end

