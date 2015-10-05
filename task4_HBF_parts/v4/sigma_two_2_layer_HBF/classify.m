function [ y_prediction ] = classify( x, c,t1,t2,sig )
%   Outout a classification label based on current parameter setting
%   i.e. the largest probability is the label we output
    [ h_x, ~, ~,~,~ ] = h( x, c, t1, t2, sig );
    y_prediction = find((max(h_x) == h_x));
    y_prediction = y_prediction(1);
end