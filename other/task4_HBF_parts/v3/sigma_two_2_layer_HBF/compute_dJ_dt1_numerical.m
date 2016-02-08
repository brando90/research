function [ dJ_dt1_numerical ] = compute_dJ_dt1_numerical(eps, x, c,t1,t2,sig)
%   Computes t1 according to:
%       df/dt1 numerically
%   Input:
%       x = data (D x 1)
%       c = weights (K2 x 1)
%       t1 = centers (Dp x Dd x Np)
%       t2 = centers (K1 x K2)
%   Output:
%       dJ_dt1 = gradeint (Dp x Dd x Np)
[Dp, Dd, Np] = size(t1);
dJ_dt1_numerical = zeros(Dp, Dd, Np);
for np=1:Np
    for dd=1:Dd
        for dp=1:Dp
            e_dd_dp_np = zeros(Dp, Dd, Np);
            e_dd_dp_np(dp,dd,np) = eps;
            f_e1 = f(x, c,t1+e_dd_dp_np,t2,sig);
            f_e2 = f(x, c,t1-e_dd_dp_np,t2,sig);
            numerical_derivative = (f_e1 - f_e2)/(2*eps);
            dJ_dt1_numerical(dp,dd,np) = numerical_derivative;
        end
    end
end
end