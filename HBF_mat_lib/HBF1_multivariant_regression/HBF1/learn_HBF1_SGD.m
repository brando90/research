function [ mdl_params ] = learn_HBF1_SGD(X_train,Y_train, mdl_params, iterations,visualize, X_test,Y_test, eta_c, eta_t)
%learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K x L)
%       t = centers (D x K)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t = (1 x 1)
%       iterations = run gradient descent for a certain number of iterations
%       visualize = whether to plot the error or not.
%   Outputs:
%       c_new = learned weights (K x 1)
%       t_new = learned centers (D x K)
[~, K] = size(mdl_params.t);
[D, N] = size(X_train);
[D_out, ~] = size(Y_train);
if visualize
    errors_train = zeros(iterations,1);
    errors_test = zeros(iterations,1);
%     changes_c = zeros(D, iterations);
%     dHf_dc_mu_c_iterion = zeros(D, iterations);
%     changes_t = zeros(K, iterations);
%     dHf_dt_mu_t_iter = zeros(K, iterations);
end
G_c = ones(K, D_out);
G_t = ones(D, K);
for i=1:iterations
%     if rem(i,100) == 0
%         i
%     end
    %% choose random data point x,y
    i_rand = randi(N);
    x = X_train(:,i_rand);
    y = Y_train(:,i_rand);
    %% get new parameters
    current_mdl = HBF1(mdl_params);
    [ f_x, ~, a ] = current_mdl.f(x);
    [c_new, dV_dc,G_c, mu_c] = update_c_stochastic(f_x,a, x,y, mdl_params, G_c,eta_c);
    [t_new, dV_dt,G_t, mu_t] = update_t_stochastic(f_x,a, x,y, mdl_params, G_t,eta_t);
%     %% get changes for c/iter.
%     change_c_wrt_current_iteration = get_dc_diter(mdl_new.c, c_new); % (L x 1)
%     changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
%     dJ_dc_col_norms = get_norms_col_dHf_dc(dJ_dc); % (L x 1)
%     dHf_dc_mu_c_iterion(:, i) = mu_c * dJ_dc_col_norms;
%     %% get changes for t2s/iter.
%     change_t_wrt_iteration = get_dt_diter(mdl_new.t, t_new );
%     changes_t(:, i) = change_t_wrt_iteration;
%     dHf_diter_col_norms = get_norms_col_dHf_dt(dJ_dt);
%     dHf_dt_mu_t_iter(:, i) = mu_t * dHf_diter_col_norms;
    %% update HBF1 model
    mdl_params.c = c_new;
    mdl_params.t = t_new;
    %% Calculate current errors
    if visualize
        mdl_new = HBF1(mdl_params);
        current_train_error = compute_Hf_sq_error(X_train,Y_train, mdl_new, mdl_params.lambda);
        current_error_test = compute_Hf_sq_error(X_test,Y_test, mdl_new, mdl_params.lambda);
        errors_train(i) = current_train_error;
        errors_test(i) = current_error_test;
    end
end
if visualize
    %% plot error progression
    figure
    iteration_axis = 1:iterations;
    plot(iteration_axis,errors_train,'-ro',iteration_axis, errors_test,'-b*');
    %plot(iteration_axis(4100:iterations) ,errors_Hfs(4100:iterations) ,'-ro',iteration_axis(4100:iterations) , errors_Test(4100:iterations) ,'-b*');
    legend('Training risk','Test risk');
    xlabel('SGD iterations') % x-axis label
    ylabel('(Squared) Error') % y-axis label
    title(sprintf('Train and Test risk over iteration -- (eta_c , e_t) = ( %d , %d )', eta_c, eta_t) );
    %% plot changes in param c
%     D = min(D,50);
%     for l=1:D
%         figure
%         c_changes_l = changes_c(l,:); % (1 x iterations)
%         subplot(2,1,1)
%         plot(iteration_axis, c_changes_l)
%         title(strcat('delta c/iter -- ', num2str(l)))
% 
%         dHf_dc_mu_c = dHf_dc_mu_c_iterion(l,:); % (1 x iterations)
%         subplot(2,1,2)
%         plot(iteration_axis, dHf_dc_mu_c)
%         title(strcat('dJ dc -- ', num2str(l)))
%     end
%     %% plot changes in param t
%     K = min(K,50);
%     for k=1:K
%         figure
%         t_changes_k = changes_t(k,:); % (1 x iterations)
%         subplot(2,1,1)
%         plot(iteration_axis, t_changes_k)
%         title(strcat('t/iter -- ', num2str(k)))
% 
%         dHf_dt_mu_t = dHf_dt_mu_t_iter(k,:); % (1 x iterations)
%         subplot(2,1,2)
%         plot(iteration_axis, dHf_dt_mu_t)
%         title(strcat('dJ dt -- ', num2str(k)))
%     end
end
end
