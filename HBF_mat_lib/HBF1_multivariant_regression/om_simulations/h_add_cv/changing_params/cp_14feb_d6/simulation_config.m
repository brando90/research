gau_precision = 0.5
num_inits = 1
iterations = 2200
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func = 'learn_RBF_SGD'
%mdl_func = 'RBF'
lambda = 0
eta_c = 0.9
eta_t = 0.9
visualize = 1
sgd_errors = 1
%% locations
cp_folder = 'cp_14feb_d6/'
cp_param_files_names = 'cp_14feb_d6_%d.m'
results_path = './results/r_14feb_d6/'
%% jobs
jobs = 1
start_centers = 10
end_centers = 10
%%
data_set_path = '../../../common/data/data_h_add_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0