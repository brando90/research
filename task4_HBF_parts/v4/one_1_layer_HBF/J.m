function [ j_xy ] = J(x,y, c,t, beta)
%Computes J(x,y)
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (1 x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%   Outputs:
%       J(y, f(x))
if any( any( isnan(c) ) ) || any( any( any( isnan(t) ) ) )
    disp(any( any( isnan(c) ) ) );
    disp(any( any( any( isnan(t1) ) ) ) );
    disp(any( any( isnan(t2) ) ) );
    keyboard
end

[~, L] = size(c);
ind = ((1:L) == y)'; %(L x 1)

[ h_x, ~ ] = h(x, c,t, beta );
exp_h_x = exp(h_x);
z = sum( exp_h_x );
log_z = log(z);
if log_z == inf
    disp('log_z == inf')
    %h_x_p = h_x(exp_h_x > 1)
    %log_z = sum(h_x_p);
    %log_z = 710;
    log_z = max(h_x);
elseif log_z == -inf
    disp('log_z == -inf')
    %h_x_p = h_x(exp_h_x < 1);
    %log_z = sum(h_x_p);
    %log_z = -709;
    %log_z = max(h_x);
    log_z = -708;
end
log_prob = h_x - log_z;
j_xy = -ind' * log_prob;

if isnan(j_xy)
    disp('h_x: ')
    disp(h_x);
    disp('log_z: ')
    disp(log_z);
    keyboard
end
end