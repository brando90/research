gau_precision = 0.5
num_inits = 2
iterations = int64(100)
% train_func_name = 'learn_HBF1_SGD'
% mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
train_func_name = 'learn_HSig_SGD'
mdl_func_name = 'HSig'
lambda = 0
eta_c = 0.01
eta_t = 0.01
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_24mar_ht_HSig2/'
cp_param_files_names = 'cp_24mar_ht_HSig2.m'
results_path = './results/r_24mar_ht_HSig2/'
%% jobs
jobs = 2
start_centers = 5
end_centers = 10
%% data
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_normalized = 0
%% GPU
gpu_on = 0
%% inits
rbf_as_initilization = 0
c_init_normalized = 0