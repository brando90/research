function [ j_xy ] = J_sq_error(x,y, mdl)
%Computes J(x,y)
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (D x 1)
%   Outputs:
%       J(y, f(x))
j_xy = norm(mdl.predict(x) - y,2)^2;
end