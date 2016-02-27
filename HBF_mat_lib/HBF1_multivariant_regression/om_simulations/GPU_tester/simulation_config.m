gau_precision = 0.5
num_inits = 1
iterations = 1000
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.9
eta_t = 0.9
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_26feb_GPU1/'
cp_param_files_names = 'cp_26feb_GPU1_%d.m'
results_path = './results/r_26feb_GPU1/'
%% jobs
jobs = 1
start_centers = 10
end_centers = 10
%%
data_set_path = '../../../common/data/data_h_add_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0