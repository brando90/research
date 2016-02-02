task_id = 2;
cp_folder = 'cp_job_debug1_2_feb_2016/';
cp_param_files_names = 'cp_job_debug1_2_feb_2016_%d.m';
results_path = './results/results_job_debug1_2_feb_2016/'
job_name = sprintf(cp_param_files_names,task_id)
changing_params_config = sprintf('./changing_params/%s%s',cp_folder, job_name);
fixed_params_config = './fixed_params.m'
get_best_trained_hbf1_model(task_id, changing_params_config, fixed_params_config, results_path)
