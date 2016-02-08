function [ dV_dc_vec ] = compute_dV_dc_vec( f,a, y )
%
dV_dc_vec = 2*bsxfun(@times, (f-y)', a);
end