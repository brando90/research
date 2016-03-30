function [ centers, list_train_errors, list_test_errors ] = collect_errors_vs_centers(path_to_dir_results, results_file_name_prefix, num_models, train_error_var_name, test_error_var_name)
results_loc_and_prefix = sprintf('%s%s*', path_to_dir_results, results_file_name_prefix);
files = dir( results_loc_and_prefix ) %collect results
centers = zeros(1,num_models); %TODO
list_train_errors = zeros(1,num_models);
list_test_errors = zeros(1,num_models);
for file = files'
    name = file.name;
    path=sprintf('%s%s',path_to_dir_results,name)
    run(path);
    i = task_id;
    centers(i) = center;
    list_train_errors(i) = eval( train_error_var_name );
    list_test_errors(i) = eval( test_error_var_name );
end
end