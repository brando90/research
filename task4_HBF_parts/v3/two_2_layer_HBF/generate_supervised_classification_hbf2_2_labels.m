function [ X, Y ] = generate_supervised_classification_hbf2_2_labels( N, D, Dp)
%generate_supervised_dumy_data_set - generates data set for 1-layer test
%   Generates data set to test 1-layer HBF architecture
%   Input:
%   N = size of data; needs to be multiple of 4
%   D = dimension of data
%   Y
num_different_labels = 2;
num_examples_for_a_class = N/num_different_labels;
%% Generate data
%% first label y_1
p1 = ones(Dp,1);
p2 = ones(Dp,1);
p2(2:2:Dp) = -1;
x1 = [p1; p2];
X1 = repmat(x1, 1, num_examples_for_a_class);
X1 = X1';
y1 = ones(num_examples_for_a_class, 1);
%% second label y_2
p3 = zeros(Dp,1);
for i=2:Dp
    p3(i) = p3(i-1) + 3.1416;
end
p4 = exp(1:Dp)';
x2 = [p3; p4];
X2 = repmat(x2, 1, num_examples_for_a_class);
X2 = X2';
y2 = -1 * ones(num_examples_for_a_class, 1);
%% Collect data 
X = [X1 X2];
Y = [y1; y2];
end

