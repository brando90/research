clear;
%% data
D = 3
N = 5
X = rand(D, N);
%% process data
x_mean = mean(X, 2); %% computes the mean of the data x_mean = sum(x^(i))
% x_mean2 = zeros(D,1);
% for i=1:N
%     x_mean2 = x_mean2 + X(:,i);
% end
% x_mean2 = x_mean2/N
X_centered = X - repmat(x_mean, [1,N]);
%% PCA
[coeff, score, latent] = pca(X'); % coeff =  U
[U, S, V] = svd(X_centered); % coeff = U
%% Reconstruct data
X_tilde_U = U*U'*X
X_tilde_coeff = coeff*coeff'*X
score
% latent
% latent.^(2)
% latent.^(0.5)
% S
% S.^(2)
% S.^(0.5)