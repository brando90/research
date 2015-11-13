function [ t1_init ] = initialization_from_data_t1( X_training_data, Dp,Dd,Np)
% initializes data points with the parts of the training set
%   Input:
%   Output:
%       t1_init = initalization from parts
X_subset = datasample(X_training_data', Dd, 'Replace', false)';
t1_init = zeros(Dp,Dd,Np);
for dd=1:Dd
    x_current = X_subset(:,dd);
    i=1;
    for np=1:Np
        j = i+Dp-1;
        part = x_current(i:j);
        t1_init(:,dd,np) = part;
        i = j+1;
    end
end
end