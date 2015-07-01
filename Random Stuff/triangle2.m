function [ y ] = triangle2( x )
%implements triangle approx to RBF: |b| - 2|b-1| + |b-2|
y = rectifier(x) -2 * rectifier(x-1) + rectifier(x-2);
end