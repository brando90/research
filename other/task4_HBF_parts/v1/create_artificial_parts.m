function [ parts ] = create_artificial_parts( num_parts, sqrt_dim_data, dim_part )
%part1
% p1 = eye(sqrt_dim_data,sqrt_dim_data);
p1 = 1:2:2*dim_part;
p1 = reshape(p1, [dim_part, 1]);
%part2: reshape magic
m = magic(sqrt_dim_data);
p2 = reshape(m, [dim_part, 1]);
%part3: reshape enumaration
offset = -50;
start_index = 1+offset;
end_index = dim_part + offset;
step=1;
p3 = start_index:step:end_index;
p3 = reshape(p3, [dim_part,1]);
%part4: same number
constant = pi;
p4 = constant * ones(dim_part,1);
%% collect parts
parts = zeros(dim_part, num_parts);
parts(:, 1) = p1;
parts(:, 2) = p2;
parts(:, 3) = p3;
parts(:, 4) = p4;
end