function [ dHf_dt ] = compute_dHf_dt_vec(F,Kern, X,y, mdl_params )
%
%   Inputs:
%       F = (N x D)
%       kern = (N x K)
%       X = (D x N)
%       y = (D x N)
[D, N] = size(X);
[K, ~] = size(mdl_params.c);
Xn = repmat(X,1,1,K); % (D x N x K)
Xn = permute(Xn,[1,3,2]); % (D x K x N)
T = repmat(mdl_params.t, 1,1,N); % ->(D x K x N)
%%
F = repmat(F,1,1,K); % (N x D x K)
F = permute(F,[2,3,1]); % ->(D x K x N)
Y = repmat(y,1,1,K); %  (D x N x K)
Y = permute(Y,[1,3,2]); % ->(D x K x N)
C = repmat(mdl_params.c',1,1,N); % ->(D x K x N)
delta = squeeze( sum( (F - Y) .* C, 2) ); % (D x N)
delta = repmat(delta, 1,1,K); % (D x N x K)
delta = permute(delta,[1,3,2]); % (D x K x N)
%%
A = repmat(Kern, 1,1,D); % (N x K x D)
A = permute(A,[3,2,1]);% ->(D x K x N)
dHf_dt = squeeze( sum(A .* delta .* (Xn - T),  3) ); %(D x K x N)
end