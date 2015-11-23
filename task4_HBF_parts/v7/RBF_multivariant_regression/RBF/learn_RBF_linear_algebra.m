function [ mdl ] = learn_RBF_linear_algebra( X_training_data, mdl, t,beta )
%
Kern_matrix = produce_kernel_matrix(X_training_data, t, beta);
C = Kern_matrix \ X_training_data';
mdl.c = C;
end