function [ h ] = getLatenRepresentation( numFilters, convolvedDim, W, b, x )
%getLatenRepresentation Computes latent/hidden representation of x
%   Computes h by using triangle function
%% Compute Beta: convolution of input with filter (x * W)
ZEROS = zeros(convolvedDim, convolvedDim);
h = zeros(convolvedDim, convolvedDim, numFilters);
for k=1:numFilters;
    W_k = rot90(W(:,:,k),2);
    convolved_feature = conv2(x, W_k, 'valid');
    b_k = b(:,:,k);
    convolved_feature = convolved_feature - b_k; %beta = conv - b
    convolvedFeature_offset = convolved_feature - 1; %beta = conv - (b + 1)
    %% Compute (recified) Sigmoids: S(beta - b)'s
    s = max(convolved_feature, ZEROS); %S(beta)
    s_b = max(convolvedFeature_offset, ZEROS); %S(beta - b - 1)
    %% Compute Triangle: T(beta - b) = S(beta - b) - S(beta - b - 1)
    t = s - s_b;
    h(:,:,k) = t; 
end;
end