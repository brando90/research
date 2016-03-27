%% PCA
clear;restoredefaultpath;clear;
tic;
%% load data set
run('./simulation_config_pca.m');
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
%%
slurm_job_id = randi([0 2^31],1,1);
jobs_to_run = jobs; %comes from config file
[coeff, ~, ~, ~, ~, mu] = pca(X_train');
for task_id=1:jobs_to_run
    get_best_trained_PCA_model(slurm_job_id, task_id, coeff, mu)
end
time_passed = toc;
run('load_paths.m');
iterations = 1;
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed )
beep;
disp('DONE getting all PCA errors')