disp('-------------------------->>> 1HBF...');
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

X = loadMNISTImages('../../common/data/train-images-idx3-ubyte');
X_test_data = loadMNISTImages('../../common/data/t10k-images-idx3-ubyte');
X = X(:,1:1000);
rankX = rank(X)
%[X, ~] = licols(X(:,1:60000));

%% Parameters
[D, N] = size(X)
K = 1000 % hidden units
lambda = 0;
%% parameter initilization ------------------------------------------------
%one_letter_of_each = X(:,[1:6,8,14,16,18]);
%t_initial = [one_letter_of_each, datasample(X', K-10, 'Replace', false)' ];
t_initial = datasample(X', K, 'Replace', false)';
%% Learn
%beta = 1e-7
beta = 1;
%% K data
%Kdata =  zeros(N, K);
%RANK = rank(Kdata)
% while rank(Kdata) ~= K
% %while rank(Ksub) ~= K
%     t_initial = datasample(X', K, 'Replace', false)' ;
%     Kdata = produce_kernel_matrix(X, t_initial, beta);
%     %[Ksub, ~] = licols(Kdata);
%     %RANK = rank(Ksub)
%     RANK = rank(Kdata)
% end

Ksub = zeros(N, K);
RANK = rank(Ksub)
while rank(Ksub) ~= K
    t_initial = datasample(X', K, 'Replace', false)' ;
    mdl_initial = HBF1(zeros(K,D),t_initial,beta);
    mdl_final = mdl_initial;
    Kdata = produce_kernel_matrix(X, t_initial, beta);
    [Ksub, ~] = licols(Kdata);
    RANK = rank(Ksub)
end
%% Kdagger
% eee = eye(N);
% Kdata = eee(:,1:K);
K_dagger = (Kdata' * Kdata) \ Kdata';

%% Compute C
C = K_dagger * X';
%Kdata = produce_kernel_matrix(X, t_initial, beta);
%rank(Kdata)
mdl_final.c = C;
size(C)
size(X')

%%
error_training_initial_model = compute_Hf_sq_error(X,X, mdl_initial, lambda)
%error_test_initial_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_initial, lambda)

error_training_final_model = compute_Hf_sq_error(X,X, mdl_final, lambda)
%error_test_final_model = compute_Hf_sq_error(X_test_data,X_test_data, mdl_final, lambda)

%% Visualize data TRAIN
originalTrainingX = X(:,1:30);
[rows_train, cols_train] = size(originalTrainingX);
reconstructionTrainingX = zeros(rows_train, cols_train);
reconstructionTrainingX_LLinearAlgebra = zeros(rows_train, cols_train);
for i=1:cols_train
    reconstructionTrainingX(:,i) = mdl_final.predict( originalTrainingX(:,i) );
    reconstructionTrainingX_LLinearAlgebra(:,i) = Kdata(i,:) * C;
end
%% visualize original_training_X
%original
figure
display_network( originalTrainingX );
title('originalTrainingX')

figure
display_network( reconstructionTrainingX );
title('reconstructionTrainingX')

figure
display_network( reconstructionTrainingX_LLinearAlgebra );
title('reconstructionTrainingX_LLinearAlgebra')
%normalized
% figure
% display_network( normc(originalTrainingX) );
% title('normc(originalTrainingX) NORMALIZED')
%figure
%display_network( normc(reconstructionTrainingX) );
%title('normc(reconstructionTrainingX) NORMALIZED')
%% visualize centers
%original
% figure;
% display_network( mdl_final.t );
% title('learned centers: mdl final.t')
% %normalized
% figure;
% display_network( normc(mdl_final.t) );
% title('learned centers normalized: normc(mdl_final.t)')
% %original
% figure;
% display_network( t_initial );
% title('initial centers: t initial')
% %normalized
% figure;
% display_network( normc(t_initial) );
% title('initial centers normalized: normc(t initial)')

%% Visualize data TEST
% originalTestX = X_test_data(:,1:30);
% [rows_test, cols_test] = size(originalTestX);
% reconstructionTestX = zeros(rows_test, cols_test);
% for i=1:cols_test
%     reconstructed_img = mdl_final.predict( originalTestX(:,i) );
%     reconstructionTestX(:,i) = reconstructed_img;
% end
% %% visualize original_training_X
% %original
% figure
% display_network( originalTestX );
% title('originalTestX')
% figure
% display_network( reconstructionTestX );
% title('reconstructionTestX')
% %normalized
% % figure
% % display_network( normc(originalTestX) );
% % title('normc(originalTestX) NORMALIZED')
% % figure
% display_network( normc(reconstructionTestX) );
% title('normc(reconstructionTestX) NORMALIZED')

%% End
beep;beep;beep;beep;beep;beep;
save('most_recent_state_of_HBF1_run')
mdl = mdl_final;
disp('---->END!!!!!!****!!!!********');