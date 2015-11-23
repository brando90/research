function [ mdl ] = learn_RBF_linear_algebra( X_training_data, Y_training_data, mdl, t,beta )
%
Kern_matrix = produce_kernel_matrix(X_training_data, t, beta); % (N x K)
C = Kern_matrix \ Y_training_data';  % (K x D) = (N x K)' x (N x D)
mdl.c = C; % (K x D)
end