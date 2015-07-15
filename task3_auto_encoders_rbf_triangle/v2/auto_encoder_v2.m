%% Data
I = imread('lena.jpeg');
I = rgb2gray(I);
I = im2double(I);
[inputDim, ~] = siz(x);
%% Parameter W
%W = [10 40 190];
filterDim = 20;
numFiters = 8;
W = rand(filterDim, filterDim, numFilters);
%% ConvolvedDim Dimensions
convolvedDim = inputDim - filterDim + 1;
%% Paramater b
b = 0:1:(convolvedDim - 1)*(inputDim - filterDim + 1);
b = reshape(b,convolvedDim - 1, convolvedDim - 1);
%% Compute Hidden layer
h = getLatenRepresentation(W,b,x);