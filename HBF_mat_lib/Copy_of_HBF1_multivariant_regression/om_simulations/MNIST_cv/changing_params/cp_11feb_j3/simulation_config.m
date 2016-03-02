gau_precision = 0.5
num_inits = 1
iterations = 49000 * 2 
% train_func = @learn_HBF_SGD;
% mdl_func = @HBF1;
lambda = 0;
eta_c = 0.1
eta_t = 0.1
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_11feb_j3/'
cp_param_files_names = 'cp_11feb_j3_%d.m'
results_path = './results/r_11feb_j3/'
%% jobs
jobs = 3
start_centers = 1
end_centers = 10
%%
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
