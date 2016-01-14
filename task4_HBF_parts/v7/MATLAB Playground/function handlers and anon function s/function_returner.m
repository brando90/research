function [ h ] = function_returner( x )
%
t = -10000;
h = @(eta)-10*x + t + eta^2;
end

