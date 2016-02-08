function [ gabor_templates ] = get_gabor_templates( m, n,  num_templates)
%get_gabour_templates Summary = returns gabor templates
%   returns a array of m x n gabor matrices.
gabor_templates = zeros(m, n, num_templates);
gabor_array = gaborFilterBank(num_templates, 1, m, n);
for k=1:num_templates;
    t = real(gabor_array{k,1});
    gabor_templates(:, :, k) = t;
end
end

