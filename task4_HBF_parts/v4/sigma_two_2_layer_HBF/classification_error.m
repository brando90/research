function [ total_number_errors ] = classification_error( y, y_predictions )
%computes classification error
%   Inputs:
%       y = true/data labels (N x 1)
%       y_predictions = true/data labels (N x 1)
%   Outputs:
%       total_number_errors = classification error (1 x 1)
%% number of times y is not equal to y_pred
total_number_errors = sum(y ~= y_predictions); 
end