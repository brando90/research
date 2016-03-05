workspace_file_name = 'beta_start_1_end_20_num_betas_5_center_180'; % <- CHANGE
job_name = 'betas_5mar_ht1'; % <- CHANGE
path_to_name_workspace_file = sprintf('../betas/%s/%s.mat', job_name, workspace_file_name);
load(path_to_name_workspace_file)
%% smallest beta
smallest
num_betas
%% times
secs
minutes
hours
%% plot
plot(betas, rbf_cv_errors)