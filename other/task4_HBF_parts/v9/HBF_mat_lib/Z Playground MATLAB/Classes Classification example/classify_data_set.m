function [ y_predictions ] = classify_data_set( X, c,t1,t2,sig )
%outputs prediction labels
%   Inputs:
%       X = data matrix (D x N)
%       c = weights (K_2 x L)
%       t_2 = centers (D_p x D_d x N_p)
%       t_1 = centers (K_1 x K_2)
%   Outputs:
%       y_prediction = single label prediction (N x 1)
[~, N] = size(X);
y_predictions = zeros(N,1);
for i=1:N
    x_i = X(:,i);
    y_prediction = classify( x_i, c,t1,t2,sig );
    y_predictions(i) = y_prediction;
end
end