function [ vectorized_templates_G ] = vectorize_matrix_template( templates_G )
%vectorize_templates = vectorized tensor image templates
%   vectorize tempaltes and collect in the usual dx|G|x|T|
[m, n, size_G, num_templates] = size(templates_G);
d = m*n;
vectorized_templates_G = zeros(d, size_G, num_templates);
for k=1:num_templates;
    G_tk = templates_G(:,:,:,k);
    for gi=1:size_G;
        M = G_tk(:,:,gi);
        vectorized = vectorize_normalize(M);
        vectorized_templates_G(:,gi,k) = vectorized;
    end
end
end

