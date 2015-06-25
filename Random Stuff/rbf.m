function [ y ] = rbf( x )
%implements RBF function: exp(- ||x - mu||^2)
y = exp( -1 * x .* x );
end

