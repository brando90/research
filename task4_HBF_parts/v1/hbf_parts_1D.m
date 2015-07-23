%%%% Skeleton Code for Learning parts code
%% Create artificial parts
sqrt_dim_part = 4;
dim_part = sqrt_dim_part*sqrt_dim_part;
num_parts = 4;
parts = create_artificial_normalized_parts(num_parts, sqrt_dim_part, dim_part);
%part1: reshape identity
%% Build all combinations synthetic images from the artificial parts
[data, tensor] = build_all_combination_of_synthetic_images_1D(parts, num_parts, dim_part);
[dim_data, num_perms] = size(data);
N = num_perms;
X_data = zeros(dim_data, N);
x_tensor = zeros(dim_part, num_parts, N);
X_data = X_data + data;
X_tensor = x_tensor + tensor;
%% Learn the adjustable centers (& params) of the HBF for the whole image
% Initialize parameters
D_p = dim_data; %output dimension = input dimension
K = dim_data/2;
%C_weights = zeros(D,1,D_p);
C_weights = rand(K,D_p); % C = [...,C_j,...]
t_centers = zeros(dim_data, K); % t = [..., t_j, ...]
%t_centers = t_centers + X_data(:,1:K);
t_centers = t_centers + rand(dim_data, K);
Y = X_data; %labels for the auto-encoder
[C_weights, t_centers] = learn_HBF_parameters(X_data, Y, C_weights, t_centers);
%% Learn the moving centers for the parts of the image
collection_parts = squeeze(x_tensor(:,1,:));
disp('collection_parts')
size(collection_parts)
K_part = K/4;
t_centers_parts = rand(dim_part, K_part);
disp('t_centers_parts')
size(t_centers_parts)
C_weights_parts = rand(K_part,dim_part);
disp('C_weights_parts')
disp(size(C_weights_parts))
[C_weights_parts, t_centers_parts] = learn_HBF_parameters(X_data, Y, C_weights_parts, t_centers_parts);
%% Test if the concatenation of the centers are the same as the full centers
