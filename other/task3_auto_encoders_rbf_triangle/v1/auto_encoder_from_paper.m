%% Data
x = 1:1:10;
%% Parameter W
W = [-1 -4 -19];
%% Dimensions
inputDim = length(x);
filterDim = length(W);
convolvedDim = inputDim - filterDim + 1;
%% Paramater b
b = 0:1:convolvedDim - 1;
%% Compute Hidden layer
h = getLatenRepresentation(W,b,x);
%% Reconstruct from hidden layer
c = 0:1:inputDim - 1;
x_tilde = getReconstruction(W,c,h);
disp('Error')
err = sqrt(norm(x_tilde - x, 2));
disp(err)