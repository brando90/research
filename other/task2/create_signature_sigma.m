function [ sigma_I ] = create_signature_sigma(I, templates_G, N, delta)
%generate_signature Summary - generate Sigma(I) = {mu^1(I),...,mu^K(I)}
%   Detailed explanation generate Sigma(I) = {mu^1(I),...,mu^K(I)}
[~, ~, K] = size(templates_G);
sigma_I = zeros(N, K);
for k=1:K;
    gt_matrix = templates_G(:, :, k);
    mu_k = compute_histogram(I, gt_matrix, N, delta);
    sigma_I(:, k) = mu_k;
end
end