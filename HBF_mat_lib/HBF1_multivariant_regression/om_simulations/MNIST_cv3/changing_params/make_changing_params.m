config_loc = 'simulation_config.m' %<-- CHANGE
run( sprintf('../%s', config_loc) ) 
job_exists = exist(cp_folder,'dir');
if job_exists == 7
    disp('error')
    disp(cp_folder)
    error('DIR/JOB ALREADY EXISTS');
end
results_path_to_make = sprintf('.%s',results_path)
results_exists = exist(results_path_to_make,'dir');
if job_exists == 7
    error('DIR/JOB ALREADY EXISTS');
end
mkdir(results_path_to_make)
mkdir(cp_folder)
source = sprintf('../%s', config_loc);
destination = sprintf('./%s', cp_folder)
copyfile(source, destination);
%% number of jobs
num_centers = jobs
centers = floor(linspace(start_centers, end_centers, num_centers));
%% create param files
for job=1:jobs;
    job_name = sprintf(cp_param_files_names,job);
    path_file = sprintf('%s%s',cp_folder,job_name);
    fileID = fopen(path_file, 'w');
    center = centers(job);
    fprintf(fileID, 'center=%d;', center);
end
disp('Done');
beep;
