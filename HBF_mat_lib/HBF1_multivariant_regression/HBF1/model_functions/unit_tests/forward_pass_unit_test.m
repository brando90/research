addpath('../');
%%
D = 2000;
K = 3000;
beta = 0.5;
x = rand(D,1);
t = rand(D, K);
[z_loops, a_loops] = forward_pass( x, t, beta );
[z_bsxfun, a_bsxfun] = forward_pass_bsxfun( x, t, beta );
[z_pdist2, a_pdist2] = forward_pass_pdist2( x, t, beta );
z_loops
z_bsxfun
z_pdist2
a_loops
a_bsxfun
a_pdist2