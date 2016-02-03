%dtm = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z');
%path = sprintf('./%d-%d-%d_%d:%d:%d',dtm.Day,dtm.Month,dtm.Year, dtm.Hour,dtm.Minute,dtm.Second);
cp_folder = 'cp_j3/'
cp_param_files_names = 'cp_j3_%d.m'
results_path = '../results/r_j3/'
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
%% number of jobs
jobs = 25
%% number of centers
start_centers = 5
end_centers = 550
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

