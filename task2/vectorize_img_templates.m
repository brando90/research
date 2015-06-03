function [ vectorized_templates_G ] = vectorize_img_templates( templates_G )
%vectorize_templates = vectorized tensor image templates
%   vectorize tempaltes and collect in the usual dx|G|x|T|
[m, n, k, size_G, num_templates] = size(templates_G);
d = m*n*k;
vectorized_templates_G = zeros(d, size_G, num_templates);
for k=1:num_templates;
    G_tk = templates_G(:,:,:,:,k);
    for gi=1:size_G;
        v = G_tk(:,:,:,gi);
        vectorized = v(:);
        vectorized_templates_G(:,gi,k) = vectorized;
    end
end
end

