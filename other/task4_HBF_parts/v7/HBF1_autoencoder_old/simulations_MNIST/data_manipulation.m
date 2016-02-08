%% Load paths
restoredefaultpath
addpath('../HBF1');
addpath('../HBF1/model_functions');
addpath('../HBF1/derivatives_c');
addpath('../HBF1/derivatives_t');
addpath('../HBF1/update_rules_GD/batch_gradient_descent');
addpath('../HBF1/analytic_tools_analysis_HBF1_GD');
addpath('../../common/squared_error_risk');
addpath('../../common/visualize_centers')
addpath('../../common/MNIST')
clear;
%%
X_training_data = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
Y_training_labels = loadMNISTLabels('../../common/data/train-labels-idx1-ubyte');
X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
Y_test_labels = loadMNISTLabels('../../common/data/t10k-labels-idx1-ubyte');
X = [X_training_data, X_test_data];
Y = [Y_training_labels; Y_test_labels]';
save('all_MNIST_Combine')