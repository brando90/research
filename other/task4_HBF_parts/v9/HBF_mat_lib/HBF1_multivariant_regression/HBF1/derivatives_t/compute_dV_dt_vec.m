function [ dV_dt_vec ] = compute_dV_dt_vec( f,a, x,y, mdl_params  )
%
f_mius_y_x_ct = bsxfun(@times, f-y, mdl_params.c'); % (D x K) = (D x 1) op (D x K)
delta_xn = sum(f_mius_y_x_ct); % (1 x K)
a_x_delta = a' .* delta_xn; % (1 x K) = (1 x K) x (1 x K)
X_minus_t = bsxfun(@minus, x, mdl_params.t); % (D x K) = (D x 1) op (D x K)
dV_dt_vec = 4 *mdl_params.beta * mdl_params.beta * bsxfun(@times, X_minus_t, a_x_delta); % (D x K)
end