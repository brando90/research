function [ x_tilde ] = getReconstruction( W, c, h )
%getReconstruction for x_tilde from hidden/latent representation h
%   x_tilde = sigma( sum_{k \in H} h^k * W_tilde^K + c)
%% Compute Alpha(x) = h * W_tilde
W_tilde = rot90(W,2);
alpha = conv2(h, W_tilde, 'full');
%alpha = conv2(W_tilde, h, 'full');
%x_tilde = sigmf(alpha+c, [1, 0]);
x_tilde = rectSig(alpha + c);
end