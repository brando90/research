function [ c_initilizations,t_initilizations ] = create_initilizations( X, num_initilizations )
%
[D, N] = size(X);
c_initilizations = zeros(N,D,num_initilizations);
t_initilizations = zeros(D,N,num_initilizations);
for i=1:num_initilizations
    c_initilizations(:,:,i) = rand(N,D);
    t_initilizations(:,:,i) = datasample(X', N, 'Replace', false)';
end
end