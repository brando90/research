%%get a better STD
clear;
run('./beta_config.m');
run('load_paths.m');
%% load data set
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
[D_out, ~] = size(y_train);
%%
betas = linspace(beta_start, beta_end, num_betas);
rbf_train_errors = zeros(1, num_betas);
rbf_cv_errors = zeros(1, num_betas);
tic;
for i=1:num_betas
    b = betas(i);
    %% init
    K = center;
    if c_init_normalized
        c_init = (1 + 1)*rand(K,D_out) - 1;
    else
        c_init = rand(K,D_out); % (N x D)
    end
    t_init = datasample(X_train', K, 'Replace', false)'; % (D x N)
    if gpu_on
        c_init = gpuArray(c_init);
        t_init = gpuArray(t_init);
    end
    %% train RBF
    rbf_mdl_params = learn_RBF_linear_algebra( X_train, y_train, RBF_parameters(c_init,t_init,gau_precision,0));
    rbf_mdl = RBF(rbf_mdl_params);
    test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_mdl, 0 );
    train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_mdl, 0 );
    if gpu_on
        mdl_params = rbf_mdl.gather();
        rbf_mdl = RBF(mdl_params); 
    end
    rbf_train_errors(i) = test_error_RBF;
    rbf_cv_errors(i) = train_error_RBF;
end
time_passed = toc;
%% write time elapsed to file
[secs, minutes, hours, ~] = time_elapsed(num_betas, time_passed )
%%
[min_cv_error, index] = min(rbf_cv_errors)
smallest = betas(index)
if visualize
    plot(betas, rbf_cv_errors)
end
beta_workspace_name = sprintf(betas_files_names, beta_start, beta_end, num_betas, center)
save( sprintf('./%s/%s/%s', parent_beta_dir, beta_simulation_dir_name, beta_workspace_name) )