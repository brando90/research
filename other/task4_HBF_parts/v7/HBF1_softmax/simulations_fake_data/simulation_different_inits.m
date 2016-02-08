%%
restoredefaultpath
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/classification');
addpath('../../common/softmax_risk');
load('../../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
%%
[Dp, Dd, Np] = size(list_dict)
D = Dp*Np
%K = Dd^Np
K = 2
L = 2
%%
%t = X_training_data(:,[1,1002]);
t = X_perfect_data;
c = rand(K,L);
c = [0.6073, 0.4501; 0.4587, 0.6619];
beta = 1;
mdl = HBF1(c,t,beta);
%% Results
%% Initial Classification Errors before learning
disp('=====> CLASSIFICATION ERRORS')
disp('-- Initial Classification Errors before learning');
print_classification_errors_train_test(X_training_data,y_training_data,X_test_data,y_test_data,mdl)