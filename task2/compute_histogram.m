function [ mu_k ] = compute_histogram(I, gt_matrix, N, delta )
%compute_histogram Summary = computes mu^k(I)
%   Detailed explanation = compute mu^k(I) by computing mu_n^k(I) for all n
mu_k = zeros(N, 1);
for n=1:N;
    mu_k_n = compute_histogram_entry_mu_k_n(I,gt_matrix, n, delta);
    mu_k(n, 1) = mu_k_n;
end
end

