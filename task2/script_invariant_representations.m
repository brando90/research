%dimension space
d = 10;
%generate random image I
I = generate_random_image(d, -1000, 1000);
%group circular shift
G = generate_circular_shift_group(d);
%number of tempaltes
num_templates = 8;
%number of components in a signature
N = 5;
delta = 4;
%generate random normalised templates_G = { { g_i*t^k }_i }_k
%templates_G = generate_memory_based_templates(G, num_templates);
templates_G = get_gabor_templates(d, 1, num_templates);
sigma_I = create_signature_sigma(I, templates_G, N, delta);
gI = G(1) * I;
sigma_gI = create_signature_sigma(gI, templates_G, N, delta);
%compute distance between signatures:
[~, m] = size(sigma_gI);
distances = zeros(m, 1);
for k = 1:m;
    mu_k_I = sigma_I(:, k);
    mu_k_gI = sigma_gI(:, k);
    dis = norm( mu_k_I - mu_k_gI , 2);
    disp(dis);
    distances(k, 1) = dis;
end
X = 1:m;
Y = distances;
plot(X, Y);
axis([1 m 0 1]);
title('Distances Plot (is it very invariant?)');