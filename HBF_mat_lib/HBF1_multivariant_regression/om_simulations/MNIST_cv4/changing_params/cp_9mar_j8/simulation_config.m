gau_precision = 0.5
num_inits = 1
iterations = int64(10 * 49000)
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
cp_folder = 'cp_9mar_j8/'
cp_param_files_names = 'cp_9mar_j8_%d.m'
results_path = './results/r_9mar_j8/'
%% jobs
jobs = 20
start_centers = 1
end_centers = 400
%% data
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_normalized = 0
%% GPU
gpu_on = 1
%% inits
rbf_as_initilization = 0
c_init_normalized = 0
