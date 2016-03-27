clear;
%%
num_models = 10;
results_file_name_prefix_PCA = '../results/r_9mar_pca_j6/';
results_file_name_prefix_RBF = '../results/r_9mar_j6/';
results_file_name_prefix_HBF1 = '../results/r_9mar_j6/';
results_file_name_prefix = 'results';
[ ~, list_train_errors_PCA, list_test_errors_PCA ] = collect_errors_vs_centers(results_file_name_prefix_PCA, results_file_name_prefix, num_models, 'train_error_PCA', 'test_error_PCA');
[ ~, list_train_errors_RBF, list_test_errors_RBF ] = collect_errors_vs_centers(results_file_name_prefix_RBF, results_file_name_prefix, num_models, 'train_error_RBF', 'test_error_RBF');
[ centers, list_train_errors_HBF1, list_test_errors_HBF1 ] = collect_errors_vs_centers(results_file_name_prefix_HBF1, results_file_name_prefix, num_models, 'train_error_HBF1', 'test_error_HBF1');
%% plot figures
fig = figure;
%plot(centers, list_train_errors_PCA, '-ro', centers, list_test_errors_PCA, '-b*');
%legend('PCA train errors','PCA test errors');
plot(centers, list_train_errors_PCA, '-bo', centers, list_test_errors_PCA, '-b*', centers, list_train_errors_RBF, '-go', centers, list_test_errors_RBF, '-g*', centers, list_train_errors_HBF1, '-ro', centers, list_test_errors_HBF1, '-r*');
legend('PCA train errors','PCA test errors','RBF train errors','RBF test errors', 'HBF1 train errors','HBF1 test errors');
title('Cost vs Centers');xlabel('number of centers');ylabel('euclidean error');
%% save figures
saveas(fig, 'errors_vs_centers_pca_rbf_hbf1');
saveas(fig, 'errors_vs_centers.jpeg');