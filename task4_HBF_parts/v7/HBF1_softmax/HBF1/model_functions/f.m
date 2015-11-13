function [ f_x, a ] = f(x,c,t,beta)
%Output of softmax network
%   Input:
%       x = data point (D x 1)
%       c = weights (K x L)
%       t = centers (D x )
%   Output:
%       f_x = p_y_x_theta (L x 1)
[h_x, a] = h(x,c,t,beta);
f_x = prob_y_x(h_x);
end