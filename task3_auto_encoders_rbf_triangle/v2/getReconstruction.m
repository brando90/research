function [ x_tilde ] = getReconstruction( numFilters, reconDim, W_p, c, h )
%getReconstruction for x_tilde from hidden/latent representation h
%   x_tilde = sigma( sum_{k \in H} h^k * W_tilde^K + c)
%% Compute Alpha(x) = h * W_tilde
ZEROS = zeros(reconDim, reconDim);
x_tilde = zeros(reconDim, reconDim);
for k=1:1:numFilters;
    W_p_k = rot90(W_p(:,:,k),2);
    h_k = h(:, :, k);
    alpha = conv2(h_k, W_p_k, 'full');
    x_tilde = max(alpha + c, ZEROS);
end;
end