%dtm = datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z');
%path = sprintf('./%d-%d-%d_%d:%d:%d',dtm.Day,dtm.Month,dtm.Year, dtm.Hour,dtm.Minute,dtm.Second);
run('../beta_config.m')
loc_name = sprintf('../%s/%s',parent_beta_dir,beta_simulation_dir_name)
job_exists = exist(loc_name,'dir');
if job_exists == 7
    disp('error')
    disp(cp_folder)
    error('DIR/BETA ALREADY EXISTS');
end
mkdir(loc_name)
source = '../beta_config.m';
destination = sprintf('%s/',loc_name)
copyfile(source, destination);
%% number of jobs
% num_centers = jobs
% centers = floor(linspace(start_centers, end_centers, num_centers));
% %% create param files
% for job=1:jobs;
%     job_name = sprintf(cp_param_files_names,job);
%     path_file = sprintf('%s%s',cp_folder,job_name);
%     fileID = fopen(path_file, 'w');
%     center = centers(job);
%     fprintf(fileID, 'center=%d;', center);
% end