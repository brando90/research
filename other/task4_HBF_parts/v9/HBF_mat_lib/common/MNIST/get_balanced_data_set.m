function [ X_train_balanced, Y_train_balanced ] = get_balanced_data_set( X_train, Y_labels, amount_per_label, num_labels )
%
[D, N] = size(X_train);
count_labels = zeros(1,num_labels);
X_train_balanced = zeros(D, amount_per_label*num_labels);
Y_train_balanced = zeros(amount_per_label*num_labels, 1);
j=1;
for i=1:N
    y_index = Y_labels(i) + 1;
    if count_labels(y_index) < amount_per_label
        count_labels(y_index) = count_labels(y_index) + 1;
        X_train_balanced(:,j) = X_train(:,i);
        Y_train_balanced(j) = Y_labels(i);
        j=j+1;
    end
end
end
