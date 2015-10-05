function [ total_number_errors ] = classification_error( X,y, c,t1,t2,sig )
%computes classification error
%   Inputs:
%       X = data matrix (D x N)
%       y = labels (N x 1)
%       c = weights (K_2 x L)
%       t_2 = centers (D_p x D_d x N_p)
%       t_1 = centers (K_1 x K_2)
%   Outputs:
%       total_number_errors = classification error (1 x 1)
[~, N] = size(X);
total_number_errors = 0;
for i=1:N
    x_i = X(:, i);
    y_i = y(i);
    y_prediction = classify(x_i, c,t1,t2,sig);
    mistake = (y_prediction ~= y_i);
    total_number_errors = total_number_errors + mistake;
end
end