function [ c_initilizations,t_initilizations ] = create_initilizations( X, mdl )
%
num_initilizations = mdl.num_initilizations;
[~, D_out] = size(mdl.c);
[D, N] = size(X);
c_initilizations = zeros(N,D_out,num_initilizations);
t_initilizations = zeros(D,N,num_initilizations);
for i=1:num_initilizations
    c_initilizations(:,:,i) = rand(N,D_out);
    t_initilizations(:,:,i) = datasample(X', N, 'Replace', false)';
end
end