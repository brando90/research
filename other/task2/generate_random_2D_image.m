function [ I ] = generate_random_2D_image( m, n, low, high )
%generate_random_2D_image
% generate random 2D image
I = randi([low, high], m, n);
end

