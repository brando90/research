%gau_precision = 8
%num_inits = 1
%iterations = 2000
%train_func_name = 'learn_HBF1_SGD'
%mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
train_func_name = 'learn_RBF_linear_algebra'
mdl_func_name = 'RBF'
lambda = 0
%eta_c = 0.001
%eta_t = 0.001
visualize = 0
%sgd_errors = 1
%% locations
parent_beta_dir = 'betas'
beta_simulation_dir_name = 'betas_8mar_j2'
betas_files_names = 'beta_start_%d_end_%d_num_betas_%d_center_%d.mat'
%% jobs
num_betas = 100000
beta_start = 0
beta_end = 100
%% RBF number of centers
center = 29
%% data
data_set_path = '../../../common/data/data_h_D10_x2sinx2_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
%% data
gpu_on = 1 
%% inits
%rbf_as_initilization = 0
c_init_normalized = 0
