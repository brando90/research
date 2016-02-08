function [ X_reconstruction ] = reconstruct( mdl, original_X )
%RECONSTRUCT Summary of this function goes here
%   Detailed explanation goes here
[rows, cols] = size(original_X);
X_reconstruction = zeros(rows, cols);
for i=1:cols
    X_reconstruction(:,i) = mdl.predict(original_X(:,i));
end
end

