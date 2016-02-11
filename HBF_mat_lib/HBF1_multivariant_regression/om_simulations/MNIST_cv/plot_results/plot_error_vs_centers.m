function [] = plot_error_vs_centers( path_to_results, num_models )
% path_to_results = './results/results'
files = dir( sprintf('%s%s', path_to_results, 'results*') ); %collect results
centers = zeros(1,num_models); %TODO
list_train_errors_HBF1 = zeros(1,num_models);
list_test_errors_HBF1 = zeros(1,num_models);
list_train_errors_RBF = zeros(1,num_models);
list_test_errors_RBF = zeros(1,num_models);
for file = files'
    name = file.name;
    path=sprintf('%s%s',path_to_results,name);
    run(path);
    i = task_id;
    centers(i) = center;
    list_train_errors_HBF1(i) = train_error_HBF1;
    list_test_errors_HBF1(i) = test_error_HBF1;
    list_train_errors_RBF(i) = train_error_RBF;
     list_test_errors_RBF(i) = test_error_RBF;
end
figure
plot(centers, list_train_errors_HBF1, '-ro', centers, list_test_errors_HBF1, '-b*', centers, list_train_errors_RBF, '-go', centers, list_test_errors_RBF, '-c*');
legend('HBF1 train errors','HBF1 test errors', 'RBF train errors', 'RBF test errors');
title('Cost vs Centers'); 
end