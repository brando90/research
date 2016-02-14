%restoredefaultpath
%clear
train_func_name = func2str(train_func)
addpath('../../HBF1');
addpath('../../../RBF_multivariant_regression/RBF');
if strcmp( train_func_name, 'learn_HBF1_SGD')
    addpath('../../HBF1/model_functions');
    addpath('../../HBF1/update_rules_GD/batch_gradient_descent');
    addpath('../../HBF1/update_rules_GD/Stochastic_gracient_descent');
    addpath('../../HBF1/derivatives_c');
    addpath('../../HBF1/derivatives_t');
elseif strcmp( train_func_name, 'learn_RBF_SGD')
    addpath('../../../RBF_multivariant_regression/RBF/model_functions');
    addpath('../../../RBF_multivariant_regression/RBF/update_rules_GD/batch_gradient_descent');
    addpath('../../../RBF_multivariant_regression/RBF/update_rules_GD/Stochastic_gracient_descent');
    addpath('../../../RBF_multivariant_regression/RBF/derivatives_c');
end
addpath('../../../common/squared_error_risk');
addpath('../../../common/visualize_centers')
addpath('../../../common/cross_validation/standard_train_cv_test_validation')
addpath('../../../common')
addpath('../../../common/MNIST')
addpath('../../../common/kernel_functions')