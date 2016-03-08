workspace_file_name = 'beta_start_0_end_30_num_betas_10000_center_95'; % <- CHANGE
job_name = 'betas_5mar_j3'; % <- CHANGE
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
fig = plot(betas, rbf_cv_errors)
saveas(fig, 'beta_vs_error');
saveas(fig, 'beta_vs_error.jpeg');