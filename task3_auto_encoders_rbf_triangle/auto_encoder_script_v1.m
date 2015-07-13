%% Data
x = [1 2 3 4];
%% Dimensions
inputDim = length(x);
filterDim = length(W);
convolvedDim = inputDim - filterDim + 1;
%% Parameters
W = [5 6 7];
b = 0:1:length(convolvedDim);
%% Compute Hidden layer
h = getLatenRepresentation(W,x);
%% Reconstruct from hidden layer


