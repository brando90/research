%% RUN DEBUG TEST
clear;restoredefaultpath;clear;
task_id = 1;
slurm_job_id = -1;
get_best_trained_hbf1_model(slurm_job_id, task_id)
%get_best_trained_rbf_model_SGD(slurm_job_id, task_id)