%% RUN DEBUG TEST
clear;restoredefaultpath;clear;
%%
slurm_job_id = randi([0 2^31],1,1);
%jobs_to_run = randi([0 2^31],1,1);
%slurm_job_id = -1;
jobs_to_run = 1;
for task_id=1:jobs_to_run
    get_best_trained_hbf1_model(slurm_job_id, task_id)
end
beep;