%%%% Skeleton Code for Learning parts code
%% Create artificial parts
sqrtD = 10;
D = sqrtD*sqrtD;
%part1: reshape identity
I = eye(sqrtD,sqrtD);
p1 = reshape(I, [1, D]);
%part2: reshape magic
m = magic(D);
p2 = reshape(m, [1, D]);
%part3: reshape enumaration
offset = -50;
start_index = 1-50;
end_index = D*D - 50;
step =1;
p3 = start_index:step:end_index;
%part4: same number
constant = pi;
p4 = constant * ones(1,D);
%% collect parts
parts(:, :, 1) = p1;
parts(:, :, 2) = p2;
parts(:, :, 3) = p3;
parts(:, :, 4) = p4;
[~, ~, num_parts] = size(parts);
%% Build all combinations synthetic images from the artificial parts
[X_data, X_tensor] = build_all_combination_of_synthetic_images(parts, num_parts, D);
%% Learn the adjustable centers of the HBF for the whole image
[C_weights, t_centers] = get_HBF_parameters(X_data);
%% Learn the moving centers for the parts of the image

%% Test if the concatenation of the centers are the same as the full centers