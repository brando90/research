function [] = plot_results( path_to_results, num_models )
% path_to_results = './results/results'
files = dir(path_to_results); %collect results
centers = zeros(1,num_models); %TODO
list_train_errors = zeros(1,num_models);
list_test_errors = zeros(1,num_models);
i=1;
for file = files'
    name = file.name;
    path=sprintf('./results/results_job_debug1_2_feb_2016/%s',name);
    run(path);
    centers(i) = center;
    list_test_errors(i) = test_error;
    list_train_errors(i) = train_errorcenter; %rename
    i=i+1;
end
figure
plot(centers, list_train_errors, '-ro', centers, list_test_errors, '-b*');
legend('list train errors','list test errors');
title('Cost vs Centers'); 
end