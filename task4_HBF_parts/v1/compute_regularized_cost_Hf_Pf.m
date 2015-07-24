function [ hf ] = compute_regularized_cost_Hf_Pf( X_data, Y, C, t, lambda )
%compute_regularized_cost_Hf_Pf computes H[f] with R(f)
%   Detailed explanation goes here
[~, N] = size(X_data);
emperical_risk = 0;
for i=1:N
    x_i = X_data(:,i);
    y_i = Y(:,i);
    f_i = f_star(x_i, C, t);
    emperical_risk = emperical_risk + norm( f_i - y_i ,2)^2;
end
regularization_cost = lambda*0; %TODO add regularization
hf = emperical_risk + regularization_cost;
end

