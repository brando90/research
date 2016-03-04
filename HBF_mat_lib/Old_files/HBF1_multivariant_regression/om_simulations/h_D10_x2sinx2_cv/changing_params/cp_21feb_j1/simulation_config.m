gau_precision = 0.5
num_inits = 1
iterations = int64(2.2 * 28000)
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
cp_folder = 'cp_21feb_j1/'
cp_param_files_names = 'cp_21feb_j1_%d.m'
results_path = './results/r_21feb_j1/'
%% jobs
jobs = 20
start_centers = 1
end_centers = 180
%%
data_set_path = '../../../common/data/data_h_D10_x2sinx_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
c_init_normalized = 0