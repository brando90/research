gau_precision = 0.5
num_inits = 5
iterations = 2000 
% train_func = @learn_HBF_SGD;
% mdl_func = @HBF1;
lambda = 0;
eta_c = 0.01
eta_t = 0.01
visualize = 0
sgd_errors = 1
%% locations
cp_folder = 'cp_10feb_j2/'
cp_param_files_names = 'cp_10feb_j2_%d.m'
results_path = './results/r_10feb_j2/'
%% jobs
jobs = 5
start_centers = 1
end_centers = 40
%%
data_set_path = '../../../common/data/data_MNIST_data4CV_1000.mat'
