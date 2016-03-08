gau_precision = 8
num_inits = 1
iterations = 210
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.1
eta_t = 0.1
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_5mar_dd3/'
cp_param_files_names = 'cp_5mar_dd3_%d.m'
results_path = './results/r_5mar_dd3/'
%% jobs
jobs = 1
start_centers = 10
end_centers = 10
%% data
data_set_path = '../../../common/data/data_h_D10_x2sinx2_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
%% GPU
gpu_on = 0
%% inits
rbf_as_initilization = 0
c_init_normalized = 0