gau_precision = 0.5
num_inits = 1
iterations = int64(10)
train_func_name = 'learn_HBF1_SGD'
mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
lambda = 0
eta_c = 0.9
eta_t = 0.9
visualize = 1
sgd_errors = 1
%% locations
cp_folder = 'cp_20feb_d1/'
cp_param_files_names = 'cp_20feb_d1_%d.m'
results_path = './results/r_20feb_d1/'
%% jobs
jobs = 1
start_centers = 10
end_centers = 10
%%
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_normalized = 0