gau_precision = 34
num_inits = 1
iterations = int64(1.4286 * 28000)
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.05
eta_t = 0.05
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_16mar_j1/'
cp_param_files_names = 'cp_16mar_j1_%d.m'
results_path = './results/r_16mar_j1/'
%% jobs
jobs = 20
start_centers = 1
end_centers = 180
%% data
data_set_path = '../../../common/data/data_h_gabor_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
%% GPU
gpu_on = 1
%% inits
rbf_as_initilization = 0
c_init_normalized = 0
