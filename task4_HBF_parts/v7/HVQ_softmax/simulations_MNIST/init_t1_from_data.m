function [ t1, X_samples ] = init_t1_from_data(X_training_data, Dd, Np )
%   input:
%
%   output:
%       t1 = (Dp x Dd x Np)
[D, ~] = size(X_training_data);
X_samples = datasample(X_training_data', Dd, 'Replace', false)';
Dp = D/Np;
t1 = zeros(Dp, Np, Dd);
for dd=1:Dd
    x_current = X_samples(:,dd);
    t1(:,:,dd) = reshape(x_current, Dp, Np);
end
t1 = permute(t1, [1, 3, 2]);
end