function [ j ] = J(x,y, c,t1,t2,sig)
%Computes J(y, f(x)) = ( y - f(x) )^2
%   Computes J(y, f(x)) = ( y - f(x) )^2 for current parameter setting
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (1 x 1)
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       J(y, f(x)) = (y - f(x))^2
[~, L] = size(c);
ind = ((1:L) == y)'; %(L x 1) 

[ h_x, ~, ~, ~, ~ ] = h( x, c, t1, t2, sig );
[~, ~, f_x_dem] = softmax_layer(h_x);
log_prob = h_x - log(f_x_dem); %log(Prob) = log(exp(hx)) - log(z)

j = ind' * log_prob;
end