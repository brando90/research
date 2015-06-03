function [ templates ] = generate_random_virgin_templates(K)
%generate_random_virgin_templates - virgin tempaltes 
%   generate random normalized templates with no transformatiosn
templates = zeros(d, K);
for k = 1:K;
    t = randi([-1000, 1000], d, 1); %d x 1 random vector
    t = t / norm(t, 2)^2;
    templates(:, k) = t;
end
end

