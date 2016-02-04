function [] = plot_results( path_to_results, num_models )
% path_to_results = './results/results'
files = dir( sprintf('%s%s', path_to_results, 'results*') ); %collect results
centers = zeros(1,num_models); %TODO
list_train_errors = zeros(1,num_models);
list_test_errors = zeros(1,num_models);
for file = files'
    name = file.name;
    %i = str2num( name(14 : (findstr(name,'.m') - 1) ) )
    path=sprintf('%s%s',path_to_results,name)
    run(path);
    centers(i) = center;
    list_test_errors(i) = test_error;
    list_train_errors(i) = train_errorcenter; %rename
end
figure
plot(centers, list_train_errors, '-ro', centers, list_test_errors, '-b*');
legend('list train errors','list test errors');
title('Cost vs Centers'); 
end