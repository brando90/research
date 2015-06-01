function [ mu_k_n ] = compute_signature_component_memory_based(I, t_k, G, n, delta)
%compute_signature_component summary = computes mu^k_n(I)
%   computes signature
[~, ~, size_of_group] = size(G);
for i = 1:size_of_group;
    g = G(:,:, i);
    %proj = dot(I, g \ t_k);
    proj = dot(I, g * t_k);
    mu_k_n = sigmf(proj - n * delta, [1 0]) / size_of_group;
    %mu_k_n = sigmf(proj, [1 0]) / size_of_group;
end
end
