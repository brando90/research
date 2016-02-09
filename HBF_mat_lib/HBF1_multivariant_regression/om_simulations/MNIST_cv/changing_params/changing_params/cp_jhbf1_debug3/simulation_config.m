gau_precision = 0.5;
num_inits = 3;
iterations = 500; 
train_func = @learn_HBF_SGD;
mdl_func = @HBF1;
lambda = 0;
eta_c = 0.01;
eta_t = 0.01;
visualize = 1
%% locations
cp_folder = './changing_params/cp_jhbf1_debug3/'
cp_param_files_names = 'cp_jhbf1_debug3_%d.m'
results_path = './results/r_jhbf1_debug3/'
%% jobs
jobs = 40;
start_centers = 1;
end_centers = 750;
%%
data_set_path = '../../../common/data/data_MNIST_data4CV_1000.mat';