%dtm = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z');
%path = sprintf('./%d-%d-%d_%d:%d:%d',dtm.Day,dtm.Month,dtm.Year, dtm.Hour,dtm.Minute,dtm.Second);
path='job_debug/'
job_exists = exist(path,'dir');
if job_exists == 7
    error('DIR/JOB ALREADY EXISTS');
end
dir_exists = mkdir(path)
%% number of jobs
jobs = 5
%% number of centers
start_centers = 1
end_centers = 5
num_centers = 5
centers = floor(linspace(start_centers, end_centers, num_centers));
%% create param files
for job=1:jobs;
    file_name = sprintf('changing_param_%d.m',job);
    path_file = sprintf('%s%s',path,file_name);
    fileID = fopen(path_file, 'w');
    center = centers(job);
    fprintf(fileID, 'center=%d;', center);
end

