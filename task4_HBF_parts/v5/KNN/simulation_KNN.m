%% Complicated data simulations with KNN
load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1')
%%
addpath('../common/classification');
%%
size(X_training_data')
size(y_training_data)
X_training_data = X_training_data';
X_test_data = X_test_data';
mdl = fitcknn(X_training_data, y_training_data);
%mdl = fitcsvm(X_training_data,y_training_data);
% %% initial classification error
% initial_y_pred_training_data = knn_mdl.predict(X_training_data);
% [initial_training_classification_error, initial_training_classification_percent_error] = classification_error( y_training_data, initial_y_pred_training_data );
% initial_y_pred_test_data = knn_mdl.predict(X_test_data);
% [initial_test_classification_error, initial_test_classification_percent_error] = classification_error(y_test_data, initial_y_pred_test_data );
%% final classification error
final_y_pred_training_data = mdl.predict(X_training_data);
[final_training_classification_error, final_training_classification_percent_error] = classification_error(y_training_data, final_y_pred_training_data);
final_y_pred_test_data = mdl.predict(X_test_data);
[final_test_classification_error, final_test_classification_percent_error] = classification_error(y_test_data, final_y_pred_test_data);
%% Print classification errors
disp('===============--------------------->>>')
disp('amount of training data');
[~, N_training_data] = size(X_training_data);
disp(N_training_data);
disp('amount of test data');
N_test_data = size(X_test_data);
disp(N_test_data);
% disp('--initial_training_classification_error');
% disp(initial_training_classification_error);
% disp('--initial_test_classification_error');
% disp(initial_test_classification_error);
disp('--final_training_classification_error');
disp(final_training_classification_error);
disp('--final_test_classification_error');
disp(final_test_classification_error);

% disp('=initial_training_classification_percent_error');
% disp(initial_training_classification_percent_error);
% disp('=initial_test_classification_percent_error');
% disp(initial_test_classification_percent_error);
disp('=final_training_classification_percent_error');
disp(final_training_classification_percent_error);
disp('=final_test_classification_percent_error');
disp(final_test_classification_percent_error);