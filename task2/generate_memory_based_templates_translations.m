function [ templates_G ] = generate_memory_based_templates_translations( templates, G )
%generate_memory_based_templates_for_rotations = rotate img templates
%   create rotated templates for image templates
[~, ~, size_G] = size(G);
[m, n, num_templates] = size(templates);
templates_G = zeros(m, n, size_G, num_templates);
G_tk = zeros(m, n, size_G);
for k=1:num_templates;
    t_img = templates(:, :, k);
    for j = 1:size_G;
        g_translation = G(:, :, j);
        gt_img = imtranslate(t_img, g_translation);
        G_tk(:, :, j) = gt_img;
    end
    templates_G(:, :, :, k) = G_tk;
end
end

