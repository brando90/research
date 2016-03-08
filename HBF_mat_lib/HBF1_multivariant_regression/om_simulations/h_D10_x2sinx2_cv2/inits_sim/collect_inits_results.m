num_iterations = 5
%
train_errors_RBF = zeros(1, num_iterations);
cv_errors_RBF = zeros(1, num_iterations);
test_errors_RBF = zeros(1, num_iterations);
train_errors_HBF1 = zeros(1, num_iterations);
cv_errors_HBF1 = zeros(1, num_iterations);
test_errors_HBF1 = zeros(1, num_iterations);
for iter_num=1:num_iterations
    errors_path = 'inits_6mar_t1'; %<-- change
    model_error_workspace = sprintf('%s/current_model_error%d',errors_path,iter_num);
    load(model_error_workspace)
    %%
    train_errors_RBF(iter_num) = train_error_RBF;
    cv_errors_RBF(iter_num) = cv_error_RBF;
    test_errors_RBF(iter_num) = test_error_RBF;
    train_errors_HBF1(iter_num) = train_error_HBF1;
    cv_errors_HBF1(iter_num) = cv_error_HBF1;
    test_errors_HBF1(iter_num) = test_error_HBF1;
end
%%
mean_train_RBF = mean(train_errors_RBF)
mean_cv_RBF = mean(cv_errors_RBF)
mean_test_RBF = mean(test_errors_RBF)
mean_train_HBF1 = mean(train_errors_HBF1)
mean_cv_HBF1 = mean(cv_errors_HBF1)
mean_test_HBF1 = mean(test_errors_HBF1)
%%
std_train_RBF = std(train_errors_RBF);
std_cv_RBF = std(cv_errors_RBF);
std_test_RBF = std(test_errors_RBF);
std_train_HBF1 = std(train_errors_HBF1);
std_cv_HBF1 = std(cv_errors_HBF1);
std_test_HBF1 = std(test_errors_HBF1);