gau_precision = 0.5
num_inits = 1
iterations = 1110
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.001
eta_t = 0.001
visualize = 1
sgd_errors = 1
%% locations
cp_folder = 'cp_18feb_d1/'
cp_param_files_names = 'cp_18feb_d1_%d.m'
results_path = './results/r_18feb_d1/'
%% jobs
jobs = 1
start_centers = 140
end_centers = 140
%%
data_set_path = '../../../common/data/data_h_sinxy_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0