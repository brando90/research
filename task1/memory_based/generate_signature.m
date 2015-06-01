function [ simga_I ] = generate_signature(I, templates, G, N)
%generate_signature Summary = generates u_^k for signature t^k
%   Detailed explanation =  generates u_^k for signature t^k
[~, K] = size(templates);
sigma_I = zeros(N, K);
for k = 1:K;
    t_k = templates(:, k);
    %compute signature for template t_k
    mu_k = zeros(N, 1);
    for n = 1:N;
        mu_k_n = compute_signature_component(I, t_k, n, G);
        mu_k(n,1) = mu_k_n;
    end
    simga_I(:, k) = mu_k;
end
end