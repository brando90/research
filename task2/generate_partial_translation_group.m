function [ G ] = generate_partial_translation_group( min_x, max_x, delta_x, min_y, max_y, delta_y )
%generate_partial_translation_group = generate Partial translation group
%   Detailed explanation goes here
range_x = min_x:delta_x:max_x;
range_y = min_y:delta_y:max_y;
G = zeros(1, 2, length(range_x) * length(range_y) );
i = 1;
for x = range_x;
    for y = range_y;
       translation_vector = [x , y];
       G(:, :, i) = translation_vector;
       i = i+1;
    end
end
end

