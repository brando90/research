name = 'betas/beta_start_0_end_20_num_betas_1000.mat'
load(name)
%% smallest beta
smallest
num_betas
%% times
secs
minutes
hours
%% plot
plot(betas, rbf_cv_errors)