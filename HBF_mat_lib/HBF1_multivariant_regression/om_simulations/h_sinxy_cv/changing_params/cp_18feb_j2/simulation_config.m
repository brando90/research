gau_precision = 0.5
num_inits = 5
iterations = int64(2.1 * 28000)
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.005
eta_t = 0.005
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_18feb_j2/'
cp_param_files_names = 'cp_18feb_j2_%d.m'
results_path = './results/r_18feb_j2/'
%% jobs
jobs = 20
start_centers = 1
end_centers = 180
%%
data_set_path = '../../../common/data/data_h_sinxy_0.7_0.15_0.15_28000_6000_6000.mat'
data_normalized = 0
