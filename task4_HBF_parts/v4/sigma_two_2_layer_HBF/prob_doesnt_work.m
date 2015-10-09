function [ prob ] = prob_doesnt_work( h_x )
% prob(y=l | x ; theta)
%   Input:
%       h = h's (L x 1)
%   Output:
%       prob = prob(y=l | x ; theta) (L x 1)
% prob = h/Z;
largest = max(h_x); 
smallest = min(h_x);
range = largest - smallest;
lower_limit = ceil( log(realmin('double')) ); %  about -708.3964
upper_limit = floor( log( realmax('double')) ); % 709.7827
limit = upper_limit - lower_limit ;
if abs(range) < limit
    %disp('abs(range) < limit')
    translation = largest - upper_limit
    h_x_p = h_x - translation
else
    %disp('else')
    indices_upper = h_x > upper_limit;
    indices_lower = h_x < lower_limit;
    h_x(indices_upper) = upper_limit;
    h_x(indices_lower) = lower_limit;  
    h_x_p = h_x;
end
exp_h_x = exp(h_x_p);
z = sum( exp_h_x );
prob = exp_h_x/z;
end

