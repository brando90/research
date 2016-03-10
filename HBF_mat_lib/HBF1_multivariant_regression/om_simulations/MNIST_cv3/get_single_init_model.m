function [] = get_single_init_model(slurm_job_id, task_id)
restoredefaultpath
slurm_job_id
task_id
run('./inits_config.m');
run('load_paths.m');
%% load configs
current_simulation_config = sprintf( './%s/%s/%s', parent_init_dir,init_folder, 'inits_config.m' )
run(current_simulation_config);
%% load data set
load(data_set_path); % data4cv
if data_normalized
    data4cv.normalize_data();
end
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, ~] = size(X_train);
%% preparing models to train/test for mdl_iterator
[D_out, ~] = size(y_train);
center
%% rand generator
rand_seed = get_rand_seed(slurm_job_id, task_id)
rng(rand_seed); % %rand_gen.Seed
%% Run Hold Out Cross Validation
tic;
if gpu_on   
    X_train = gpuArray(X_train);
    y_train = gpuArray(y_train);
    X_cv = gpuArray(X_cv);
    y_cv = gpuArray(y_cv);
    X_test = gpuArray(X_test);
    y_test = gpuArray(y_test);
end
%% RBF with linear algebra (LA)
K = center;
c_init = (1 + 1)*rand(K,D_out) - 1;
t_init = datasample(X_train', K, 'Replace', false)'; % (D x N)
if c_init_normalized
    c_init = normc(c_init);
end
if gpu_on
    c_init = gpuArray(c_init);
    t_init = gpuArray(t_init);
end
rbf_mdl = RBF(c_init,t_init,gau_precision,lambda);
rbf_mdl = learn_RBF_linear_algebra( X_train, y_train, rbf_mdl);
%% train HBF1
if rbf_as_initilization
    c_init = rbf_mdl.c;
    t_init = rbf_mdl.t;
end
mdl = HBF1(c_init,t_init,gau_precision,lambda);
[ hbf_mdl, errors_iter_train, errors_iter_test ] = learn_HBF1_SGD( X_train, y_train, mdl, iterations,visualize, X_test,y_test, eta_c,eta_t, sgd_errors);
%% Errors of models
train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_mdl, rbf_mdl.lambda )
cv_error_RBF = compute_Hf_sq_error(X_cv,y_cv, rbf_mdl, rbf_mdl.lambda )
test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_mdl, rbf_mdl.lambda )
%
train_error_HBF1 = compute_Hf_sq_error(X_train,y_train, hbf_mdl, hbf_mdl.lambda )
cv_error_HBF1 = compute_Hf_sq_error(X_cv,y_cv, hbf_mdl, hbf_mdl.lambda )
test_error_HBF1 = compute_Hf_sq_error(X_test,y_test, hbf_mdl, hbf_mdl.lambda )
%%
time_passed = toc;
%% save everything/write errors during iterations
rbf_mdl = rbf_mdl.gather();
hbf_mdl = hbf_mdl.gather()
vname=@(x) inputname(1);
%% save error of model RBF and HBF1
path_error_iterations = sprintf('./%s/%s/%s%d',parent_init_dir,init_folder,'current_model_error',task_id);
save(path_error_iterations, vname(train_error_RBF), vname(cv_error_RBF), vname(test_error_RBF), vname(train_error_HBF1), vname(cv_error_HBF1), vname(test_error_HBF1))
%% save errors_vs_iterations of RBF and HBF1
path_error_iterations = sprintf('./%s/%s/%s%d',parent_init_dir,init_folder,'test_error_vs_iterations',task_id);
save(path_error_iterations, vname(errors_iter_train),vname(errors_iter_test), vname(center), vname(iterations), vname(eta_c), vname(eta_t), vname(hbf_mdl), vname(rbf_mdl) );
%% write time elapsed to file
[secs, minutes, hours, ~] = time_elapsed(iterations, time_passed)
path_error_iterations = sprintf('./%s/%s/%s%d',parent_init_dir,init_folder,'time_duration_om_id',task_id);
save(path_error_iterations, vname(task_id),vname(secs),vname(minutes),vname(hours),vname(iterations),vname(center),vname(data_set_path));
disp('DONE');
disp('DONE training model')
end