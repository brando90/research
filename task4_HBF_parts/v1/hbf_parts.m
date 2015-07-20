%%%% Skeleton Code for Learning parts code
%% Create artificial parts
D = 40;
p1 = eye(D,D);
p2 = magic(D);
p3 = diag( 0:1:D-1 );
k = 5;
p4 = k * ones(D);
parts(:, :, 1) = p1;
parts(:, :, 2) = p2;
parts(:, :, 3) = p3;
parts(:, :, 4) = p4;
[~, ~, num_parts] = size(parts);
%% Build all combinations synthetic images from the artificial parts
X = build_all_combination_of_synthetic_images(parts, num_parts, D);

%% Learn the moving centers of the HBF for the whole image

%% Learn the moving centers for the parts of the image

%% Test if the concatenation of the centers are the same as the full centers