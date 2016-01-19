function [ mdl_params ] = learn_RBF_linear_algebra( X_training_data, Y_training_data, mdl_params )
%
Kern_matrix = produce_kernel_matrix(X_training_data, mdl_params.t, mdl_params.beta); % (N x K)
C = Kern_matrix \ Y_training_data';  % (K x D) = (N x K)' x (N x D)
mdl_params.c = C; % (K x D)
end