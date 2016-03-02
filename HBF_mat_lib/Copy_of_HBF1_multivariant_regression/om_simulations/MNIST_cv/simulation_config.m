%j
gau_precision = 0.5
num_inits = 2
iterations = 5000 * 10 
% train_func = @learn_HBF_SGD;
% mdl_func = @HBF1;
lambda = 0;
eta_c = 0.01
eta_t = 0.01
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_11feb_j4/'
cp_param_files_names = 'cp_11feb_j4_%d.m'
results_path = './results/r_11feb_j4/'
%% jobs
jobs = 5
start_centers = 1
end_centers = 20
%%
%data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_set_path = '../../../common/data/data_MNIST_data4CV_5000.mat'
data_normalized = 1
