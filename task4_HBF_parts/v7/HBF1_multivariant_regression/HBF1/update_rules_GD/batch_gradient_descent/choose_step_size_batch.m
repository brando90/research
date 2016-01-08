function [ mu_theta ] = choose_step_size_batch(F,Kern, dHf_dtheta, y)
%   inputs:
%       Kern = (N x K)
%       dHf_dtheta:
%           dHf_dt = (D x K)
%% TODO do we really need c? should it be theta? for t or c?
Kdelta = Kern*dHf_dtheta; % (N x D)
F_Y = F - y'; % (N x D)
denom = sum(sum(Kdelta .* (F_Y)));
num = sum(sum(Kdelta .* Kdelta));
mu_theta = -denom/ num;
end