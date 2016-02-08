function [ hidden_feature ] = getLatenRepresentation( W, b, x )
%getLatenRepresentation Computes latent/hidden representation of x
%   Computes h by using triangle function
%% Compute Beta: convolution of input with filter (x * W)
convolved_feature = conv(x, W, 'valid');
%convolved_feature = conv(W, x, 'valid');
convolved_feature = convolved_feature - b; %beta = conv - b
convolvedFeature_offset = convolved_feature - 1; %beta = conv - (b + 1)
%% Compute (recified) Sigmoids: S(beta - b)'s
s = rectSig(convolved_feature); %S(beta)
s_b = rectSig(convolvedFeature_offset); %S(beta - b - 1)
% s = sigmf(convolved_feature, [1, 0]); %S(beta)
% s_b = sigmf(convolvedFeature_offset, [1, 0]); %S(beta - b - 1)
%% Compute Triangle: T(beta - b) = S(beta -b) - S(beta - b - 1)
t = s - s_b;
hidden_feature =  t;
end

