%% RUN DEBUG TEST
clear;restoredefaultpath;clear;
%%
slurm_job_id = 2;
jobs_to_run = 5;
for task_id=1:jobs_to_run
    get_single_init_model(slurm_job_id, task_id)
end
beep;