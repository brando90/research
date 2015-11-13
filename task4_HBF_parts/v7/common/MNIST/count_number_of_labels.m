function [ counts ] = count_number_of_labels( Y_labels, num_labels )
%
N = length(Y_labels);
counts = zeros(1,num_labels);
for i=1:N
    y = Y_labels(i) + 1;
    counts(y) = counts(y) + 1;
end
end
