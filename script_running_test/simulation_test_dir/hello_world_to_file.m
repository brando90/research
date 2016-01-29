function [] = hello_world_to_file(arg1)
path = '/om/user/brando90/research/script_running_test/simulation_test_dir/simulation_results/hello_world_'; 
path = strcat( strcat(path, int2str(arg1) ), '.txt');
fileID = fopen(path, 'w'); %open or creates a file on path
fprintf(fileID, 'content: %1d %2d \n', arg1, arg1+1);
end
