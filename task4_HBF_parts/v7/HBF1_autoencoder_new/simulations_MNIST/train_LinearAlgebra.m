function [ mdl ] = train_LinearAlgebra( X_training_data, mdl, t_initial,beta)
%
Kern_matrix = produce_kernel_matrix(X_training_data, t_initial, beta);
C = pinv(Kern_matrix) * X_training_data';
mdl.c = C;
end