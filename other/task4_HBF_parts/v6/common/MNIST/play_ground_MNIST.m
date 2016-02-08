% Introduction
% The MNIST dataset is a dataset of handwritten digits, comprising 60 000 training examples and 10 000 test examples. 
%The dataset can be downloaded from http://yann.lecun.com/exdb/mnist/.

% Usage
% The image and label data is stored in a binary format described on the website. 
% For your convenience, we have provided two MATLAB helper functions for extracting the data. 
% These functions are available at http://ufldl.stanford.edu/wiki/resources/mnistHelper.zip.
% As an example of how to use these functions, you can check the images and labels using the following code:
% Change the filenames if you've saved the files under different names
% On some platforms, the files might be saved as 
% train-images.idx3-ubyte / train-labels.idx1-ubyte

%images = loadMNISTImages('../data/train-images-idx3-ubyte');
%labels = loadMNISTLabels('../data/train-labels-idx1-ubyte');
%display_network(images(:,1:100)); % Show the first 100 images
 
% We are using display_network from the autoencoder code
images = loadMNISTImages('../data/train-images-idx3-ubyte');
display_network(images(:,1:100)); % Show the first 100 images