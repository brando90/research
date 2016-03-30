function [fig] = plot_errors_vs_centers_results( path_to_results, num_models )
% path_to_results = './results/results'
files = dir( sprintf('%s%s', path_to_results, 'results*') ); %collect results
centers = zeros(1,num_models); %TODO
list_train_errors_HBF1 = zeros(1,num_models);
list_test_errors_HBF1 = zeros(1,num_models);
list_train_errors_RBF = zeros(1,num_models);
list_test_errors_RBF = zeros(1,num_models);
for file = files'
    name = file.name;
    path=sprintf('%s%s',path_to_results,name)
    run(path);
    i = task_id;
    centers(i) = center;
    list_train_errors_HBF1(i) = train_error_HBF1;
    list_test_errors_HBF1(i) = test_error_HBF1;
    list_train_errors_RBF(i) = train_error_RBF;
    list_test_errors_RBF(i) = test_error_RBF;
end
% load('../rbf_real')
% list_train_errors_real_RBF = repmat( train_error_RBF,[1,num_models]);
% list_test_errors_real_RBF = repmat( test_error_RBF,[1,num_models]);
%%
centers = centers(1,1:num_models);
list_train_errors_HBF1 = list_train_errors_HBF1(1,1:num_models);
list_test_errors_HBF1 = list_test_errors_HBF1(1,1:num_models);
list_train_errors_RBF = list_train_errors_RBF(1,1:num_models);
list_test_errors_RBF = list_test_errors_RBF(1,1:num_models);
% list_train_errors_real_RBF = list_train_errors_real_RBF(1,1:num_models);
% list_test_errors_real_RBF = list_test_errors_real_RBF(1,1:num_models);
%%
fig = figure
plot(centers, list_train_errors_HBF1, '-ro', centers, list_test_errors_HBF1, '-b*', centers, list_train_errors_RBF, '-go', centers, list_test_errors_RBF, '-c*');
%plot(centers, list_train_errors_HBF1, '-ro', centers, list_test_errors_HBF1, '-b*', centers, list_train_errors_RBF, '-go', centers, list_test_errors_RBF, '-c*', centers, list_train_errors_real_RBF, '-m*', centers, list_test_errors_real_RBF, '-k*');
%legend('HBF1 SGD mdl train errors','HBF1 SGD mdl test errors', 'RBF train errors', 'RBF test errors', 'list_test_errors_RBF', 'list_test_errors_real_RBF');
legend('HBF1 SGD mdl train errors','HBF1 SGD mdl test errors', 'RBF train errors', 'RBF test errors');
title('Cost vs Centers');
xlabel('number of centers')
ylabel('euclidean error')
end