function [ X, Y ] = generate_supervised_classification_dumy_data_set( N, D)
%generate_supervised_dumy_data_set - generates data set for 1-layer test
%   Generates data set to test 1-layer HBF architecture
%   Input:
%   N = size of data; needs to be multiple of 4
%   D = dimension of data
%   Y
num_different_labels = 4;
num_examples_for_a_class = N/num_different_labels;
%% Generate data
% x_1
x1 = zeros(D, num_examples_for_a_class);
first_number_of_sequence = 1:2:2*num_examples_for_a_class;
for n=1:num_examples_for_a_class
    first_num = first_number_of_sequence(n);
    x1(1,n) = first_num;
    for i=1:D
        x1(i,n) = x1(i-1,n) + 2;
    end
    x1(:,n) = x1(:,n)/ norm(x1(:,n), 2);
end
y1 = 1*ones(D, num_examples_for_a_class);
% x_2
x2 = zeros(D, num_examples_for_a_class);
first_number_of_sequence = 1:0.1:1+0.1 *(num_examples_for_a_class-1);
for n=1:num_examples_for_a_class
    first_num = first_number_of_sequence(i);
    x2(1,n) = first_num;
    for i=1:D
        x2(i,n) = x2(i-1,n)^2 + pi;
    end
    x2(:,n) = x2(:,n)/ norm(x2(:,n), 2);
end
y2 = 2*ones(D, num_examples_for_a_class);
% x_3
x3 = zeros(D, num_examples_for_a_class);
x3 = x3 + -1*ones(D, num_examples_for_a_class);
x3 = x3 / norm(x3(:,1), 2);
y3 = 3*ones(D, num_examples_for_a_class);
% x_4
x4 = zeros(D, num_examples_for_a_class);
first_number_of_sequence = 1:num_examples_for_a_class;
for n=1:num_examples_for_a_class
    first_num = first_number_of_sequence(n);
    x4(1,n) = first_num;
    for i=1:D
        x4(i,n) = -1.1* x4(i-1,n);
    end
    x4(:,n) = x4(:,n)/ norm(x4(:,n), 2);
end
y4 = 4*ones(D, num_examples_for_a_class);
%% Collect data 
X = [x1 x2 x3 x4];
Y = [y1; y2; y3; y4];
end

