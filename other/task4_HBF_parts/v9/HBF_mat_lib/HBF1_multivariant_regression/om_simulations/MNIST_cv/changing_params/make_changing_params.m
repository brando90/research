%dtm = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z');
%path = sprintf('./%d-%d-%d_%d:%d:%d',dtm.Day,dtm.Month,dtm.Year, dtm.Hour,dtm.Minute,dtm.Second);
cp_folder = 'cp_jhbf1_debug/' %CHANGE
cp_param_files_names = 'cp_jhbf1_debug_%d.m' %CHANGE
results_path = '../results/r_jhbf1_debug/' %CHANGE
job_exists = exist(cp_folder,'dir');
if job_exists == 7
    error('DIR/JOB ALREADY EXISTS');
end
results_exists = exist(results_path,'dir');
if job_exists == 7
    error('DIR/JOB ALREADY EXISTS');
end
mkdir(results_path)
mkdir(cp_folder)
source = '../fixed_params.m';
destination = sprintf('./%s', cp_folder);
copyfile(source, destination);
%% number of jobs
jobs = 40 %CHANGE
%% number of centers
start_centers = 1 %CHANGE
end_centers = 750 %CHANGE
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

