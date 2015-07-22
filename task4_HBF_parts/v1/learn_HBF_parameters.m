function [ C, T ] = learn_HBF_parameters( X_data, C_weights, t_centers )
%get_HBF_parameters = get C's, t's assuming M=I
%   get C's, t's by gradient descent assuming M=I
%   S is the training data set dim=(dim_data, num_data)=(Dxnum_parts,N)
[dim_data, N] = size(X_data);
[K, ~] = size(t_centers); %K = number of hidden units
C = zeros(K, D);


end

