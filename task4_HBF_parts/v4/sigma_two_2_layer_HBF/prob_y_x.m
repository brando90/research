function [ prob ] = prob_y_x( h_x )
% prob(y=l | x ; theta)
%   Input:
%       f = f's (L x 1)
%   Output:
%       prob = prob(y=l | x ; theta) (L x 1)
% Z = sum(f);
% prob = f/Z;
largest = max(h_x); 
smallest = min(h_x);
range = largest - smallest;
upper_limit = ceil( log(realmin('double')) ); %  about -708.3964
lower_limit = floor( realmax('double') ); % 709.7827
limit = upper_limit - lower_limit ;
if abs(range) < limit
    translation = largest - upper_limit;
    h_x_p = h_x - translation;    
else
    keyboard
end
exp_h_x = exp(h_x_p);
z = sum( exp_h_x );
prob = exp_h_x/z;
end