

%% Visualize data TRAIN
print_reconstructions( mdl_final_GD, X_training_data, X_test_data, text_GD );
print_reconstructions( mdl_final_LA, X_training_data, X_test_data, text_LA)

%% visualize centers
% figure;
% display_network( mdl_final_GD.t );
% title('learned centers: mdl final GD.t')