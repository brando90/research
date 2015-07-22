%%%% Skeleton Code for Learning parts code
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
%% Build all combinations synthetic images from the artificial parts
[data, tensor] = build_all_combination_of_synthetic_images(parts, num_parts, D);
[~, num_perms] = size(data);
N = num_perms;
X_data = zeros(D*num_parts, N);
x_tensor = zeros(D, num_parts, N);
X_data = X_data + data;
X_tensor = x_tensor + tensor;
%% Learn the adjustable centers (& params) of the HBF for the whole image
% Initialize parameters
D_p = D; %output dimension = input dimension
K = N/2;
%C_weights = zeros(D,1,D_p);
C_weights = rand(K,D_p); % C = [...,C_j,...]
t_centers = zeros(D,K); % t = [..., t_j, ...]
t_centers = t_centers + X_data(1:K);
[C_weights, t_centers] = get_HBF_parameters(X_data, C_weights, t_centers);
%% Learn the moving centers for the parts of the image

%% Test if the concatenation of the centers are the same as the full centers