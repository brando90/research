function [ templates_G ] = generate_memory_based_templates_for_img_rotations( img_templates, G )
%generate_memory_based_templates_for_rotations = rotate img templates
%   create rotated templates for image templates
size_G = length(G);
[m, n, k, num_templates] = size(img_templates);
templates_G = zeros(m, n, k, size_G, num_templates);
G_tk = zeros(m, n, k, size_G);
for k=1:num_templates;
    t_img = img_templates(:, :, :, k);
    for j = 1:size_G;
        angle = G(j);
        gt_img = imrotate(t_img, angle);
        size(gt_img)
        G_tk(:, :, :, j) = gt_img;
    end
    templates_G(:, :, :, :, k) = G_tk;
end
end

