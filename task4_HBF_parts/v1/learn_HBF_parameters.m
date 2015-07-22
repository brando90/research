function [ C, T ] = learn_HBF_parameters( X_data, Y, C_weights, t_centers )
%get_HBF_parameters = get C's, t's assuming M=I
%   get C's, t's by gradient descent assuming M=I
%   X_data = (dim_data, num_data)=(Dxnum_parts,N)
[D, N] = size(X_data); %D=dim of data, N=num of data points
[K, ~] = size(t_centers); %K = number of hidden units
C = zeros(K, D);
T = zeros(D,K);
f_s = f_start(x, C_weights, t_centers);
for i=1:100
    F_star = f_star_all_data(X_data);
    delta_i = Y - F_star;
    C = C_weights - sum(delta_i) * (-2) *
end;
end

