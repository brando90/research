function [ y ] = triangle( x )
%implements triangle approx to RBF: max(0, 1 - x)
y = zeros(length(x));
for i=1:1:length(x);
    y(i) = max([0, 1 - abs(x(i)) ]);
end
end

