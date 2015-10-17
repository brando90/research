function [ c_new, dHf_dc ] = update_c_batch(X,y,c,t,mu_c, lambda )
%update_c_batch
%   Updates c according to:
%       c := c - mu_c * dJ/dc
%   Input:
%       c = weights (K x L)
%       y = label (1 x 1)
%       a_l3 = activations l3 (K2 x 1)
%       mu_c = step size (1 x 1)
%       lambda = reg param (1 x 1)
%   Output:
%       c = updated weights (K2 x 1)
%       dHf_dc = derivative (K2 x 1)
[~, N] = size(X);
dHf_dc = zeros(K,L);
for i=1:N
    x_i = X(:,i);
    [h, a] = h(x_i,c,t,beta);
    dJ_dc = compute_dJ_dc(h,y,a); %(K x L)
    dHf_dc = dHf_dc + dJ_dc;
end
regularization_term = 0; %TODO
dHf_dc = dHf_dc + lambda * regularization_term;
%% update
c_new = c - mu_c * dHf_dc;
end