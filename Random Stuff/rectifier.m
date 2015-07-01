function [ y ] = rectifier( x )
%rectifier y = max(0, x)
for i=1:1:length(x);
    y(i) = max(0, x(i));
end
end

