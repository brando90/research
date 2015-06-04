function [ I ] = generate_random_image( d, low, high )
%UNTITLED4 Summary = generates a random normalized image in R^d
%   Detailed explanation = rand I, needs to be zero centered.
I = randi([low, high], d, 1);
I = I / norm(I, 2)^2;
end

