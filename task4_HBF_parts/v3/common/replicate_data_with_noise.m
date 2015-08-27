function [ X_noise, y_new] = replicate_data_with_noise( X, y, m )
%   Input:
%       X = data (Dp x N)
%       y = labels (N x 1)
%       m = number of times to replicate each class
%   Output:
%       X_noise = data with white noise and replicated (Dp x Nm)
[Dp, N] = size(X);
X_noise = zeros([Dp, N*m]);
y_new = zeros([N*m, 1]);
for t=1:N
    % add noise to x
    Xt = X(:,t);
    Xt = repmat(Xt, 1, m);
    Xt_noise = awgn(Xt, 25);
    X_noise(:,(t-1)*m+1:t*m) = Xt_noise;
    % replicate y
    yt = y(t);
    yt = repmat(yt, m, 1);
    y_new ((t-1)*m+1:t*m) = yt;
end
end