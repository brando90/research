function [ j_xy ] = J(x,y, mdl)
%Computes J(x,y)
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (1 x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%   Outputs:
%       J(y, f(x))
if mdl.any_nan()
    keyboard;
end

[~, L] = size(c);
ind = ((1:L) == y)'; %(L x 1)

[ h_x, ~, ~ ] = mdl.h(x);
exp_h_x = exp(h_x);
z = sum( exp_h_x );
log_z = log(z);
if log_z == inf
    %log_z = 710;
    log_z = max(h_x);
elseif log_z == -inf
    log_z = -708;
    %log_z = min(h_x);
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