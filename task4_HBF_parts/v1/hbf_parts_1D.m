%%%% Skeleton Code for Learning parts code
%% Create artificial parts
disp('Running code to test concatentation of centers...')
lambda = 0;
sqrt_dim_part = 4;
dim_part = sqrt_dim_part*sqrt_dim_part;
num_parts = 4;
parts = create_artificial_parts(num_parts, sqrt_dim_part, dim_part);
%% Build all combinations of synthetic images from the artificial parts
[data, tensor] = build_all_combination_of_synthetic_images_1D(parts, num_parts, dim_part);
[dim_data, num_perms] = size(data);
N = num_perms;
X_data = zeros(dim_data, N) + data;
x_tensor = squeeze(zeros(dim_part, num_parts, N) + tensor);
%% Learn the adjustable centers (& params) of the HBF for the whole image
% Initialize parameters
D_p = dim_data; %output dimension = input dimension
K = dim_data/2;
%C_weights = zeros(D,1,D_p);
C_weights = rand(K, D_p); % C = [...,C_j,...]
t_centers = zeros(dim_data, K); % t = [..., t_j, ...]
%t_centers = t_centers + X_data(:,1:K);
t_centers = t_centers + rand(dim_data, K);
Y = X_data; %labels for the auto-encoder
[C_weights, t_centers] = learn_HBF_parameters(X_data, Y, C_weights, t_centers, lambda);
%% Learn the moving centers for the parts of the image
collection_parts = squeeze(x_tensor(:,1,:)) / norm( X_data(:,1) ,2 );
K_part = K/num_parts;
t_centers_parts = rand(dim_part,K_part);
C_weights_parts = rand(K_part,dim_part);
Y = collection_parts;
[C_weights_parts, t_centers_parts] = learn_HBF_parameters(collection_parts, Y, C_weights_parts, t_centers_parts, lambda);
%% Test if the concatenation of the centers are the same as the full centers
%Does there exists, for every center, a concatentation of the smaller parts
%such that, there i
tau = 0.4;
t_centers_parts_collection = zeros(dim_part,K_part,num_parts);
for i=1:num_parts
    t_centers_parts_collection(:,:,i) = t_centers_parts;
end
[all_match_vectors, all_number_of_matches] = number_of_centeres_made_by_parts(num_parts, t_centers, t_centers_parts_collection, tau);
disp(all_match_vectors);
disp(all_number_of_matches);