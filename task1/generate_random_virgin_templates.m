function [ templates ] = generate_random_virgin_templates( d, K )
%generate_random_virgin_templates sumary = generate random templates, not
% acted by a group
% d = dimension
% K = number of templates
%

templates = zeros(d, K);
for k = 1:K;
    r = randi([-1000, 1000], d, 1); %d x 1 random vector
    r = r / norm(r, 2)^2;
    templates(:, k) = r;
end


end

