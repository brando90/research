gau_precision = 8
%num_inits = 1
%iterations = 2000
%train_func_name = 'learn_HBF1_SGD'
%mdl_func_name = 'HBF1'
train_func_name = 'learn_RBF_SGD'
mdl_func_name = 'RBF'
lambda = 0
%eta_c = 0.001
%eta_t = 0.001
visualize = 0
%sgd_errors = 1
%% locations
beta_loc = 'betas'
betas_files_names = 'beta_start_%d_end_%d_num_betas_%d_center_%d.m'
results_path = './results/r_16feb_d1/'
%% jobs
%jobs = 1
%start_centers = 140
%end_centers = 140
center = 180
%%
data_set_path = '../../../common/data/data_h_gabor_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
%
gpu_on = 0
