function [ y ] = rectSig( x )
%rectSig computes vector-wise rectified linear function
%  computes y = [..., max(0,x_i), ...]
n=length(x);
y = zeros(1,n);
for i=1:1:length(x);
    y(i) = max(0,x(i));
end
end

