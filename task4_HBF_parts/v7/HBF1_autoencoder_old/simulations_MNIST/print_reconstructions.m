function [ ] = print_reconstructions( mdl_final, X_training_data, X_test_data, text )
%
originalTrainingX = X_training_data(:,1:30);
[rows_train, cols_train] = size(originalTrainingX);
reconstructionTrainingX = zeros(rows_train, cols_train);
for i=1:cols_train
    reconstructed_img = mdl_final.predict( originalTrainingX(:,i) );
    reconstructionTrainingX(:,i) = reconstructed_img;
end
%% visualize original_training_X
%original
figure
display_network( originalTrainingX );
title(strcat('originalTrainingX ', text))
colorbar
figure
display_network( reconstructionTrainingX );
title(strcat('reconstructionTrainingX', text))
colorbar
%normalized
% figure
% display_network( normc(originalTrainingX) );
% title('normc(originalTrainingX) NORMALIZED')
figure
display_network( normc(reconstructionTrainingX) );
title(strcat('normc(reconstructionTrainingX) NORMALIZED', text))
colorbar

%% Visualize data TEST
originalTestX = X_test_data(:,1:30);
[rows_test, cols_test] = size(originalTestX);
reconstructionTestX = zeros(rows_test, cols_test);
for i=1:cols_test
    reconstructed_img = mdl_final.predict( originalTestX(:,i) );
    reconstructionTestX(:,i) = reconstructed_img;
end
%% visualize original_training_X
%original
figure
display_network( originalTestX );
title(strcat('originalTestX', text))
colorbar
figure
display_network( reconstructionTestX );
title(strcat('reconstructionTestX', text))
colorbar
%normalized
% figure
% display_network( normc(originalTestX) );
% title('normc(originalTestX) NORMALIZED')
figure
display_network( normc(reconstructionTestX) );
title(strcat('normc(reconstructionTestX) NORMALIZED', text))
colorbar
end

