%dimension space
d = 10;

%generate random image I
I = generate_random_image(d, -1000, 1000);

%group circular shift
G = generate_circular_shift(d);
[~, ~, size_G] = size(G);

%number of tempaltes
K = 10;
%number of components in a signature
N = 10;

% delta
delta = 3;

%generate random templates K
templates = generate_random_virgin_templates(d, K );

%generate signature S(I) and S(gI)
sigma_I = generate_signature_memory_based(I, templates, G, N, delta);
gI = G(5) * I;
sigma_gI = generate_signature_memory_based(gI, templates, G, N, delta);

%compute distance between signatures:
[~, m] = size(sigma_gI);
disp('Computing distance bewteen signatures');
for k = 1:m;
    mu_k_I = sigma_I(:, k);
    mu_k_gI = sigma_gI(:, k);
    dis = norm( mu_k_I - mu_k_gI , 2);
    disp('sginature number: ');
    disp(k);
    disp(dis);
end

