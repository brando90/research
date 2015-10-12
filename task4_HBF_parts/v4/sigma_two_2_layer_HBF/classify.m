function [ y_prediction ] = classify( x, c,t1,t2,sig )
%   Outout a classification label based on current parameter setting
%   i.e. the largest probability is the label we output
%   Inputs:
%       x = data matrix (D x 1)
%       c = weights (K_2 x L)
%       t_2 = centers (D_p x D_d x N_p)
%       t_1 = centers (K_1 x K_2)
%   Outputs:
%       y_prediction = single label prediction (1 x 1)
    [ h_x, ~, ~,~,~ ] = h( x, c, t1, t2, sig );
    y_prediction = find((max(h_x) == h_x));
    y_prediction = y_prediction(1);
end