function [ X, Y ] = generate_supervised_classification_hbf2_2_labels( N, Dp)
%generate_supervised_dumy_data_set - generates data set for 1-layer test
%   Generates data set to test 1-layer HBF architecture
%   Input:
%       N = size of data, needs to be multiple of 2 (1 x 1)
%       D = dimension of data (1 x 1)
%   Output:
%       X = data (Dp x N)
%       Y = labels (N x 1)
num_different_labels = 2;
num_examples_for_a_class = N/num_different_labels;
%% Generate data
%% data for first label y_1
% x = [p1 ; p2] = [1 ... 1; 1 -1 ... -1 1]
x1_p1 = ones(Dp,1);
x1_p2 = ones(Dp,1);
x1_p2(2:2:Dp) = -1;
x1 = [x1_p1; x1_p2];
X1 = repmat(x1, 1, num_examples_for_a_class);
y1 = ones(num_examples_for_a_class, 1);
%% second label y_2
x2_p1 = zeros(Dp,1);
for i=2:Dp
    x2_p1(i) = x2_p1(i-1) + 3.1416;
end
x2_p2 = exp(1:Dp)';
x2 = [x2_p1; x2_p2];
X2 = repmat(x2, 1, num_examples_for_a_class);
y2 = -1 * ones(num_examples_for_a_class, 1);
%% Collect data 
X = [X1 X2];
size(X)
Y = [y1; y2];
end

