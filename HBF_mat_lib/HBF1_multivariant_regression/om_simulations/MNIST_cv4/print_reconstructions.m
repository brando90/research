function [ ] = print_reconstructions( mdl_final, X_training_data, X_test_data )
%
originalTrainingX = X_training_data(:,1:30);
[rows_train, cols_train] = size(originalTrainingX);
reconstructionTrainingX = zeros(rows_train, cols_train);
for i=1:cols_train
    reconstructed_img = mdl_final.predict( originalTrainingX(:,i) );
    reconstructionTrainingX(:,i) = reconstructed_img;
end
%% visualize original_training_X
figure
display_network( reconstructionTrainingX );
title(strcat('reconstructionTrainingX', text))
colorbar
end