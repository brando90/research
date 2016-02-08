function [ Kern ] = produce_kernel_matrix_bsxfun( X, t, beta )
%   Inputs:
%       X = (D x N)
%       t = (D x K)
%       beta = precision (1 x 1)
%   Outputs:
%       Kern = (N x K)
X = X';
t = t';
nsqX=sum(X.^2,2); % (N x 1)
nsqt=sum(t.^2,2); % (N x 1)
Kern=bsxfun(@minus,nsqX,(2*X)*t.'); % (N x K)
Kern=bsxfun(@plus,nsqt.',Kern); % (N x K)
Kern=exp(-beta*Kern); % (N x K)
% nsq=sum(X.^2,2);
% K=bsxfun(@minus,nsq,(2*X)*X.');
% K=bsxfun(@plus,nsq.',K);
% K=exp(-beta*K);
end

