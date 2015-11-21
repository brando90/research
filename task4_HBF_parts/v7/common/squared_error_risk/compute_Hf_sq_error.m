function [ regularized_cost_hf ] = compute_Hf_sq_error( X,y, mdl, lambda )
%compute_Hf - computes regularized cost 
%H[F] = sum (y_i, f(x_i))^2 + lambda || Pf ||^2
%   Inputs:
%       X = data (D x N)
%       y = target func (D x N)
%   Outputs:
%       regularized_cost_hf = cost H[f]=sum(y_i,f(x_i))^2+lambda||Pf||^2
regularized_cost_hf = compute_Hf_sq_error_vec( X,y, mdl, lambda );
end
