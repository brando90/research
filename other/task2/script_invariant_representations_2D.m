%% Parameters
%d = 10; %dimension space
num_templates = 8; %number of tempaltes
N = 5; %number of components/bins in a histogram signature
delta = 4;
delta_angle = 45; %group rotation group
%% Generate Group of Transformations
%G = generate_rotation_group_angle(delta_angle); %list of angles
disp('Rotation Angles')
G = 0:delta_angle:360;
%G = G(1:length(G)-1)
%% Image creation
%I = generate_random_image(d, -1000, 1000);
I = imread('lena.jpeg');
I = rgb2gray(I);
I = im2double(I);
gI = imrotate(I, G(1));
[m, n, k] = size(I);
range = [0 255];
%% Template Creating 
%generate random normalised templates_G = { { g_i*t^k }_i }_k
templates = generate_random_virgin_img_templates(m,n,k,num_templates,range);
templates_G = generate_memory_based_templates_for_img_rotations(templates,G);
%% Vectorize Images
templates_G = vectorize_img_templates(templates_G);
I = vectorize_normalize(I);
gI = vectorize_normalize(gI);
%% Invariate Signature Creating
sigma_I = create_signature_sigma(I, templates_G, N, delta);
sigma_gI = create_signature_sigma(gI, templates_G, N, delta);
%compute distance between signatures:
[~, m] = size(sigma_gI);
distances = zeros(m, 1);
for k = 1:m;
    mu_k_I = sigma_I(:, k);
    mu_k_gI = sigma_gI(:, k);
    dis = norm( mu_k_I - mu_k_gI , 2);
    disp('distance');
    disp(dis);
    distances(k, 1) = dis;
end
X = 1:m;
Y = distances;
plot(X, Y);
axis([1 m 0 1]);
title('Distances Plot (is it very invariant?)');