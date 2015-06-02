function [ templates_G ] = generate_random_tempaltes_transformed( d, K, G )
%generate_random_tempaltes_transformed = all the transformed tempaltes
%   d = dim
%   K = number of templates
%   G = group that will act on the templates
[~, ~, size_G] = size(G);
templates_G = zeros(d, K * size_G);
for k = 1:K;
    t = randi([-1000, 1000], d, 1); %d x 1 random vector
    for g_i = 1:size_G;
        g = G(:, :, g_i);
        tg = g * t;
        tg = tg / norm(tg, 2)^2;
        templates_G(:, k) = tg;
    end
end
end