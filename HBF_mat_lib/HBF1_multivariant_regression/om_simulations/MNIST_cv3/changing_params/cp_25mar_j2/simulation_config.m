%gau_precision = 0.00008006
num_inits = 400
iterations = int64(3000)
%train_func_name = 'learn_HBF1_SGD'
%mdl_func_name = 'HBF1'
%train_func_name = 'learn_RBF_SGD'
%mdl_func_name = 'RBF'
train_func_name = 'learn_HSig_SGD'
mdl_func_name = 'HSig'
lambda = 0
eta_c = 0.05
eta_t = 0.05
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_25mar_j2/'
cp_param_files_names = 'cp_25mar_j2_%d.m'
results_path = './results/r_25mar_j2/'
%% jobs
jobs = 10
start_centers = 1
end_centers = 250
%% data
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_normalized = 0
%% GPU
gpu_on = 1
%% inits
rbf_as_initilization = 0
c_init_normalized = 0