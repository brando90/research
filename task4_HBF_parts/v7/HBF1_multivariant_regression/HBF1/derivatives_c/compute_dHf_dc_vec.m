function [ dHf_dc ] = compute_dHf_dc_vec(Kern,y, c,lambda)
%Computes dHf_dc
[N, ~] = size(Kern)
y = y';
dHf_dc = (2/N) * ( Kern' * (Kern * c - y) );
regularized_cost = 0;
dHf_dc = dHf_dc + lambda * regularized_cost;
end