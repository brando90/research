clear;
task_id = 9
%%
run('./simulation_config.m');
run('load_paths.m');
%% load configs
current_simulation_config = sprintf( './changing_params/%s%s', cp_folder, 'simulation_config.m' )
run(current_simulation_config);
%% load data set
load(data_set_path); % data4cv
if data_normalized
    disp('DATA NORMALIZED')
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
%% get models
results_path = results_path(2:length(results_path)-1 )
mdl_location = sprintf('.%s/test_error_vs_iterations%d',results_path,task_id);
load(mdl_location)
%% images
mnist_image_train = X_train(:,3);
reconstruction_HBF1 = best_iteration_mdl.predict( mnist_image_train );
reconstruction_rbf = best_iteration_mdl.predict( mnist_image_train );
%% original 
figure
display_network( mnist_image_train );
title('Original Image')
%% HBF1 reconstruct
figure
display_network( reconstruction_HBF1 );
title(sprintf('reconstruction%d', task_id))
colorbar
title(sprintf('HBF1 reconstruction task id = %d',task_id))
%%
figure
display_network( reconstruction_rbf );
title(sprintf('reconstruction%d', task_id))
title(sprintf('RBF reconstruction task id = %d',task_id))
colorbar