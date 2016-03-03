%% Unit test
beta = 1;
N = 5;
X = rand(N,D);
K_loops = produce_kernel_matrix_loops( X, X, beta);
K_bsxfun = produce_kernel_matrix_bsxfun( X, X, beta );
K_pdist2  = produce_kernel_matrix_pdist2( X, X, beta );
%% Should be the same
K_pdist2
K_loops
K_bsxfun
disp('----');
%% Unit test
beta = 1;
N = 5;
D = 3;
K = 4;
X = rand(D,N);
t = X(:,1:K);
K_loops = produce_kernel_matrix_loops( X, t, beta);
K_bsxfun = produce_kernel_matrix_bsxfun( X, t, beta );
K_pdist2  = produce_kernel_matrix_pdist2( X, t, beta );
%% Should be the same
K_pdist2
K_loops
K_bsxfun