function [] = print_classification_errors_train_test( X_training_data, y_training_data, X_test_data,y_test_data, mdl )
%Classification displays all errors related to classification
%% initial classification error
y_pred_training_data = classify_data_set( X_training_data, mdl );
[~, training_classification_percent_error] = classification_error( y_training_data, y_pred_training_data );
y_pred_test_data = classify_data_set( X_test_data, mdl );
[~, test_classification_percent_error] = classification_error(y_test_data, y_pred_test_data );
%% Print classification errors
% disp('===============--------------------->>>')
% disp('amount of training data');
% [~, N_training_data] = size(X_training_data);
% disp(N_training_data);
% disp('amount of test data');
% N_test_data = size(X_test_data);
% disp(N_test_data);

% disp('training_classification_error');
% disp(training_classification_error);
% disp('test_classification_error');
% disp(test_classification_error);

disp('TRAINING_classification_percent_error');
disp(training_classification_percent_error);
disp('TEST_classification_percent_error');
disp(test_classification_percent_error);

end