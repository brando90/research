clear;
workspace_file_name = 'beta_start_0_end_40_num_betas_1250_center_250'; % <- CHANGE
job_name = 'betas_21mar_j1'; % <- CHANGE
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
fig = plot(betas, rbf_train_errors, '-ro', betas, rbf_test_errors, '-b*')
legend('RBF train errors','RBF test errors');
title('Errors (squared) vs Precision of Gaussian/beta = \beta = 1/(2 \pi \sigma)  ');
xlabel('Precision of Gaussian/beta = \beta = 1/(2 \pi \sigma)')
ylabel('Error (squred/euclidean error)')
saveas(fig, 'beta_vs_error');
saveas(fig, 'beta_vs_error.jpeg');