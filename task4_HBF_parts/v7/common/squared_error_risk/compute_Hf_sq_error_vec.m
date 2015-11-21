function [ regularized_cost_hf ] = compute_Hf_sq_error( X,y, mdl, lambda )
%compute_Hf - computes regularized cost
f = mdl.predict_data_set(X);
regularized_cost_hf = norm( f - y ,2)^2
end
