function [ dV_dt_vec ] = compute_dV_dt_vec( f,a,z, x,y, mdl  )
s_dv_dak = bsxfun(@times, 2*(f-y), mdl.c'); % (D x K) = (D x 1) op (D x K)
dV_da = sum(s_dv_dak); % (1 x K)
da_dz = (z >= 0)'; % (1 x K)
dV_dt_vec = bsxfun(@times, dV_da .* da_dz , x); % (D x K)
end