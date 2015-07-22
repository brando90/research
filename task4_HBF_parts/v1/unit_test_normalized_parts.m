%% Unit test for normalized parts
%% Create artificial parts
sqrtD = 10;
D = sqrtD*sqrtD;
%part1: reshape identity
I = eye(sqrtD,sqrtD);
p1 = reshape(I, [D, 1]);
%part2: reshape magic
m = magic(sqrtD);
p2 = reshape(m, [D, 1]);
%part3: reshape enumaration
offset = -50;
start_index = 1-50;
end_index = D - 50;
step =1;
p3 = start_index:step:end_index;
p3 = reshape(p3, [D,1]);
%part4: same number
constant = pi;
p4 = constant * ones(D,1);
%% collect parts
parts(:, 1) = p1;
parts(:, 2) = p2;
parts(:, 3) = p3;
parts(:, 4) = p4;
[~, num_parts] = size(parts); % (D x num_parts)
%% TEST
unit_parts = normalize_parts(parts);
unit_vector = reshape(unit_parts, [1, D*num_parts]);
%unit_vector2 = reshape(unit_parts, [D*num_parts,1]);
length_vector = norm(unit_vector, 2);
disp(length_vector);
if length_vector ~= 1
    error('Length of vector is not equal to 1, length is: %d', length_vector);
end
disp('success, vector is length 1');
