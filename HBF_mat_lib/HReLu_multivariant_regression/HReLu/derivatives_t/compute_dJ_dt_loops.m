function [ dJ_dt ] = compute_dJ_dt_loops(f_x,a,z,x,y,t,c)
%Computes dJ_dc
%   Input:
%       z = (K x 1)
%       x = data point (D, 1)
%       y = labels (1 x 1)
%       t = centers (D x K)
%       c = weights (K x D)
%   Output:
%       dJ_dt = (D x K)
[K, D] = size(c);
[D_p,~] = size(t);
dJ_dt = zeros(D_p,K);
for k=1:K
    dJ_dt_k = zeros(D_p,1);
    for d=1:D
        dV_dak = 2*(f_x(d) - y(d)) * c(k,d); % (1 x 1)
        dak_dzk = z(k) >= 0;
        dak_dtk =  dak_dzk * x ; %(D+1 x 1)
        dJ_dt_k = dJ_dt_k + dV_dak * dak_dtk;
    end
    dJ_dt(:,k) = dJ_dt_k;
end
end