function [ y ] = rectifier_offset( a, x )
%rectifier_offset: implements max(a, x)
%   max(a, x), a is a constant number, x is the domain of the function
y = zeros(1, length(x));
for i=1:1:length(x);
    y(i) = max(a, x(i));
end
end

