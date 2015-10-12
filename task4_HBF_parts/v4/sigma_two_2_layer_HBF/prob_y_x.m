function [ prob ] = prob_y_x( h_x )
% prob(y=l | x ; theta)
%   Input:
%       h = h's (L x 1)
%   Output:
%       prob = prob(y=l | x ; theta) (L x 1)
% prob = h/Z (L x 1)
%% constants
lower_limit = ceil( log(realmin('double')) ); %  about -708.3964
upper_limit = floor( log( realmax('double')) ); % 709.7827
L = length(h_x);
%% Algorithm
largest = max(h_x);
if largest > upper_limit - log(L)
    disp('here')
    h_x = h_x - largest - log(L);
    indices_lower = h_x < lower_limit;
    h_x(indices_lower) = lower_limit;
end
exp_h_x = exp(h_x);
z = sum( exp_h_x );
prob = exp_h_x/z;
end