function [ G ] = generate_circular_shift_group( d )
%generate_circular_shift = generates circular shift G
%   Detailed explanation  = generates circular shift G
G = zeros(d,d,d-1);
g = zeros(d);
g(1,d) = 1;
g(2:d , 1:d-1) = eye(d-1);
G(:, :, 1) = g;
for i = 2:d-1;
    G(:, :, i) = g * G(:, :, i-1);
end
end

