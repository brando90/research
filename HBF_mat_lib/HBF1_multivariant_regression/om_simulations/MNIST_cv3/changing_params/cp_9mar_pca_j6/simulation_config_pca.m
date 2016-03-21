%% PCA
train_func_name = 'PCA' %DOESN'T actually do anything, not set to anything, load_paths will crash
%% locations
cp_folder = 'cp_9mar_pca_j6/'
cp_param_files_names = 'cp_9mar_pca_j6_%d.m'
results_path = './results/r_9mar_pca_j6/'
%% jobs
jobs = 10
start_centers = 1
end_centers = 250
%% PCA model location
load_pca = 0
pca_mdl_loc = ''
%% data
data_set_path = '../../../common/data/data_MNIST_0.7_0.15_0.15_49000_10500_10500.mat'
data_normalized = 0
%% GPU
gpu_on = 0