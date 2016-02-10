function [ f ] = h_add(x,y)
% sin(2 pi x ) + 4(y - 0.5)^2
f = sin(2*pi*x) + 4*(y - 0.5).^2;
end