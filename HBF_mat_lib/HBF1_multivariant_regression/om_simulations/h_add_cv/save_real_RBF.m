run('./simulation_config.m');
run('load_paths.m');
load(data_set_path);
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, N] = size(X_train);
%%
vname=@(x) inputname(1);
lambda = 0
D_out = 1
c_init = (6 + 6)*rand(N,D_out) - 6;
t_init = X_train;
rbf_real_mdl_params = RBF_parameters(c_init,t_init,gau_precision, lambda);
rbf_real_mdl_params = learn_RBF_linear_algebra( X_train, y_train, rbf_real_mdl_params);
rbf_real_mdl = RBF(rbf_real_mdl_params);
test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_real_mdl, lambda )
train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_real_mdl, lambda )
save('./rbf_real', vname(rbf_real_mdl) );