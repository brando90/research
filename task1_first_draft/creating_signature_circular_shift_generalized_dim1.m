%dimension space
d = 10;

%generate random image I
I = generate_random_image(d, -1000, 1000);

%group circular shift
G = generate_circular_shift(d);

%number of tempaltes
K = 5;
%number of components in a signature
N = 3;

%generate random templates K
templates = zeros(d, K);
for k = 1:K;
    r = randi([-1000, 1000], d, 1); %d x 1 random vector
    r = r / norm(r, 2)^2;
    templates(:, k) = r;
end

sigma_I = generate_signature(I, templates, G, N);
gI = G(1) * I;
sigma_gI = generate_signature(gI, templates, G, N);

%compute distance between signatures:
[~, m] = size(sigma_gI);
for k = 1:m;
    mu_k_I = sigma_I(:, k);
    mu_k_gI = sigma_gI(:, k);
    dis = norm( mu_k_I - mu_k_gI , 2);
    disp(dis);
end

