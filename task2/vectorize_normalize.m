function [ v ] = vectorize_normalize( M )
% Vectorizes and normalizes given tensor/matrix
v = M(:);
v = v / norm(v, 2)^2;
end

