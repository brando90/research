addpath('../..');
addpath('../../derivatives_c');
addpath('../../derivatives_t');
addpath('../../update_rules');
addpath('../../analytic_tools_analysis_HBF1_GD');
addpath('../../../../common/softmax_risk');
%% dh_dt unit test
disp('==================-------------------');
K = 4;
L = 2;
D = 3;
x = rand(D,1);
c = rand(K,L);
t = rand(D,K);
lambda = 0;
beta = 1;
[~, z, ~] = h(x,c,t,beta);
dh_dt = zeros([D, K, L]);
%dh_dt_vec = zeros([D, K, L]);g
%dh_dt_z_Forward_Pass = zeros([D, K, L]);
for l=1:L
    c_l = c(:,l);
    dh_dt(:,:,l) = compute_dh_dt(z,x,t,c_l);
    %dh_dt_vec(:,:,l) = compute_dh_dt_vec(z,x,t,c_l);
    %dh_dt_z_Forward_Pass(:,:,l) = compute_dh_dt_z_forward_pass( z,x,t,c_l );
end
eps = 1e-10;
dh_dt_numerical = compute_dh_dt_numerical_derivatives(x,c,t,beta,eps);
%% print derivatives
%dh_dt_z_Forward_Pass
disp('----');
dh_dt
%disp('----');
%dh_dt_vec
disp('----');
dh_dt_numerical