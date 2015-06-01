function [ templates_G ] = generate_memory_based_templates(G)
%generate_memory_based_templates = generates {{g_it^k}_i}_k
%  generates templates_G = {{g_it^k}_i}_k with unit norm. i.e. |g_it^k| = 1
[~, d, ~] = size(G);
[~, ~, size_G] = size(G);
templates_G = zeros(d, size_G, K);
for k = 1:K;
    t = randi([-1000, 1000], d, 1); %d x 1 random vector
    G_tk = zeros(d, size_G); %transformations of template tk
    %generate all transformed templates
    for i = 1:size_G;
        gi = G(:, :, i);
        gi_tk = gi * t;
        gi_tk = gi_tk / norm(gi_tk, 2)^2;
        G_tk(:, i) = gi_tk;
    end
    templates_G(:, :, k) = G_tk;
end
end