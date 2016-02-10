gau_precision = 0.5;
num_inits = 20;
iterations = 3 * 23330; 
train_func = @learn_HBF_SGD;
mdl_func = @HBF1;
lambda = 0;
eta_c = 0.01;
eta_t = 0.01;
visualize = 1
%% locations
cp_folder = 'cp_9feb_j1/'
cp_param_files_names = 'cp_9feb_j1_%d.m'
results_path = './results/r_9feb_j1/'
%% jobs
jobs = 25;
start_centers = 1;
end_centers = 25;
%%
data_set_path = '../../../common/data/data_MNIST_data4CV_23330.mat';
