%dimension space
d = 3;

%generate random image I
%I = randi([-1000, 1000], d, 1);
I = [1 ; 2; 3];

%group circular shift
G = [0 0 1; 1 0 0; 0 1 0];
circ = G;

%number of tempaltes
K = 4;
%number of components in a signature
%N = 12;


%generate random templates K
% templates = zeros(d, K);
% for k = 1:K;
%     r = randi([-1000, 1000], 3, 1); %3 x 1 random vector
%     %r = r / norm(r, 2);
%     templates(:, k) = r;
% end

t1 = [4; 2; 9];
t2 = [5; 5; 5];
t3 = [7; 8; 9];
t4 = [1; 5; 11];
templates(:, 1) = t1;
templates(:, 2) = t2;
templates(:, 3) = t3;
templates(:, 4) = t4;

[t_m, t_n] = size(templates);
sigma_I = generate_signature(I, templates, G, N);
gI = circ * I;
sigma_gI = generate_signature(gI, templates, G, N);

%compute distance between signatures:
[~, m] = size(sigma_gI);
for k = 1:m;
    mu_k_I = sigma_I(:, k);
    mu_k_gI = sigma_gI(:, k);
    dis = norm( mu_k_I - mu_k_gI , 2);
    disp(dis);
end

