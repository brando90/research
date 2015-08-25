function [ X_noise] = replicate_data_with_noise( X, m )
%   Input:
%       X = data (Dp x N)
%       m = number of times to replicate each class
%   Output:
%       X_noise = data with white noise and replicated (Dp x Nm)
[~, N] = size(X);
X_noise = zeros([0]);
for t=1:N
    Xt = X(:,t);
    Xt = repmat(Xt, 1, m);
    Xt_noise = awgn(Xt, 15);
    X_noise = [X_noise, Xt_noise];
    %X_noise(:,(t-1)*m+1:t*m-1) = Xt_noise;
end
end

