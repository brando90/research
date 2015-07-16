%% Data
I = imread('lena.jpeg');
I = rgb2gray(I);
I = im2double(I);
[inputDim, ~] = size(I);
%% Parameter W
filterDim = 5;
numFilters = 3;
W = randn(filterDim, filterDim, numFilters);
W_p = randn(filterDim, filterDim, numFilters);
%% Convolutions Dimensions
convolvedDim = inputDim - filterDim + 1;
reconDim = inputDim;
%% Offsets b & c
b = zeros(convolvedDim, convolvedDim, numFilters);
for k=1:1:numFilters;
    b_k = (k-1)*ones(convolvedDim * convolvedDim);
end;
c = ones(reconDim, reconDim);
%% Compute Hidden layer
h = getLatenRepresentation(numFilters, convolvedDim, W,b,I);
%% Reconstruct
I_tilde = getReconstruction(numFilters, reconDim, W_p, c, h);
%% Error
err = sqrt(norm( I_tilde - I ,2));
disp(err);