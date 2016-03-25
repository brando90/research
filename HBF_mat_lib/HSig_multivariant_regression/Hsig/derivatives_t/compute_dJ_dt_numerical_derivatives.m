function [ dJ_dt_numerical ] = compute_dJ_dt_numerical_derivatives(x,y,c,t,eps)
[D_p, K] = size(t);
dJ_dt_numerical = zeros(D_p, K);
lambda = 0; %TODO
for d=1:D_p
    for k=1:K
        e = zeros([D_p,K]);
        e(d,k) = eps;
        J_e2 = norm( HSig(c,t+e,lambda).predict(x) - y, 2)^2;
        J_e1 = norm( HSig(c,t-e,lambda).predict(x) - y, 2)^2;
        %J_e2 = J_sq_error(x,y, HSig(c,t+e,lambda) ); %norm(mdl.predict(x) - y,2)^2;
        %J_e1 = J_sq_error(x,y, HSig(c,t-e,lambda) ); %norm(mdl.predict(x) - y,2)^2;
        numerical_derivative = (J_e2 - J_e1)/(2*eps);
        dJ_dt_numerical(d,k) = numerical_derivative;
    end
end
end