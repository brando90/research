function [ y_predictions ] = predict_labels_for_model( mdl, X )
%Make predictions for model
%   Input:
%       mdl = model object
%       X = data (N x D)
y_predictions = mdl.predcit(X);
end

