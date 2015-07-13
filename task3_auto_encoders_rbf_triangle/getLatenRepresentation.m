function [ h ] = getLatenRepresentation( W, b, x )
%getLatenRepresentation Computes latent representation of x
%   Computes h by using triangle function
%% Compute Beta: convolution of input with filter (x * W)
convolved_feature = conv(W, x, 'valid');
convolvedFeature_offset = convolvedFeature - b;

%% Compute Sigmoids: S(beta - b)'s

%% Compute Triangle: T(beta - b) = S(beta -b) - S(beta - b - 1)
t = sig(temp_feature_emap - b) - sig(temp_feature_map - (b+1));
h=t;
end

