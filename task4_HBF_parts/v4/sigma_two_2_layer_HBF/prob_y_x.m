function [ prob ] = prob_y_x( f )
% prob(y=l | x ; theta)
%   Input:
%       f = f's (L x 1)
%   Output:
%       prob = prob(y=l | x ; theta) (L x 1)
Z = sum(f);
prob = f/Z;
end