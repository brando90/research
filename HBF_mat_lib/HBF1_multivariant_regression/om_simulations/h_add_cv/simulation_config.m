gau_precision = 0.5;
num_inits = 1;
iterations = 100; 
train_func = @learn_HBF1_SGD;
mdl_func = @HBF1;
% train_func = @learn_RBF_SGD;
% mdl_func = @RBF;
lambda = 0;
eta_c = 0.01;
eta_t = 0.01;
visualize = 1
%% locations
cp_folder = 'cp_13feb_d1/'
cp_param_files_names = 'cp_13feb_d1_%d.m'
results_path = './results/r_13feb_d1/'
%% jobs
jobs = 40;
start_centers = 1;
end_centers = 750;
%%
data_set_path = '../../../common/data/data_h_add_0.7_0.15_0.15_28000_6000_6000.mat';
data_normalized = 0