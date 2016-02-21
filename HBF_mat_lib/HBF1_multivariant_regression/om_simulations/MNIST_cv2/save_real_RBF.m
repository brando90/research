run('./simulation_config.m');
run('load_paths.m');
load(data_set_path);
[ X_train,X_cv,X_test, y_train,y_cv,y_test ] = data4cv.get_data_for_hold_out_cross_validation();
[D, N] = size(X_train);
%%
tic;
vname=@(x) inputname(1);
lambda = 0
D_out = 1
c_init_normalized = 0
if c_init_normalized
    c_init = normc(rand(K,D_out)); % (N x D)
else
    c_init = rand(K,D_out); % (N x D)
end
t_init = X_train;
rbf_real_mdl_params = RBF_parameters(c_init,t_init,gau_precision, lambda);
rbf_real_mdl_params = learn_RBF_linear_algebra( X_train, y_train, rbf_real_mdl_params);
rbf_real_mdl = RBF(rbf_real_mdl_params);
test_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_real_mdl, lambda )
cv_error_RBF = compute_Hf_sq_error(X_test,y_test, rbf_real_mdl, lambda )
train_error_RBF = compute_Hf_sq_error(X_train,y_train, rbf_real_mdl, lambda )
time_passed = toc
%%
save('./rbf_real', vname(rbf_real_mdl), vname(train_error_RBF), vname(cv_error_RBF), vname(test_error_RBF));
beep;beep;