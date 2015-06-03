function [ mu_k_n ] = compute_histogram_entry_mu_k_n(I,gt_matrix, n, delta)
%compute_histogram_entry_mu_k_n Summary = mu_k_n(I) = 1/|G|sum_g sigma(<I,gt> - ndelta)
%   Detailed explanation = mu_k_n(I) = 1/|G|sum_g sigma(<I,gt> - ndelta)
[~, size_G] = size(gt_matrix);
mu_k_n = 0;
for g=1:size_G;
    gt = gt_matrix(:,g);
    soft_count = sigmf(dot(I, gt) - (n * delta),[1 0]);
    mu_k_n = mu_k_n + soft_count;
end
end

