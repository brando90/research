clear;restoredefaultpath;clear;
task_id = 4;
cp_folder = 'cp_jhbf1_debug/';
cp_param_files_names = 'cp_jhbf1_debug_%d.m';
results_path = './results/r_jhbf1_debug/'
job_name = sprintf(cp_param_files_names,task_id)
changing_params_config = sprintf('./changing_params/%s%s',cp_folder, job_name);
fixed_params_config = './changing_params/cp_jhbf1_debug/fixed_params.m'
get_best_trained_hbf1_model(task_id, changing_params_config, fixed_params_config, results_path)