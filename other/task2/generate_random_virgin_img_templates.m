function [ virgin_templates ] = generate_random_virgin_img_templates(m,n,k,num_templates,range)
%generate_random_virgin_templates - virgin tempaltes 
%   generate random normalized templates with no transformatiosn
virgin_templates = zeros(m, n, k, num_templates);
dimensions = [m, n, k];
for k = 1:num_templates;
    t = randi(range, dimensions); % m x n x k random tensor/matrix
    virgin_templates(:, :, :, k) = t;
end
end