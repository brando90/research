function [ mdl_new ] = learn_HBF1_batch_GD(X,y, mdl, mu_c,mu_t, lambda, iterations,visualize)
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
[~, K] = size(mdl.t);
[~, D] = size(mdl.c);
errors_Hfs = zeros(iterations,1);
changes_c = zeros(D, iterations);
dHf_dc_mu_c_iterion = zeros(D, iterations);
changes_t = zeros(K, iterations);
dHf_dt_mu_t_iter = zeros(K, iterations);
mdl_new = HBF1(mdl.c, mdl.t, mdl.beta);
for i=1:iterations
    %% get new parameters
    [c_new, dHf_dc] = update_c_batch(X,y, mdl_new, mu_c, lambda);
    [t_new, dHf_dt] = update_t_batch(X,y, mdl_new, mu_t, lambda);
    %% get changes for c/iter.
    change_c_wrt_current_iteration = get_dc_diter(mdl_new.c, c_new); % (L x 1)
    changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
    dJ_dc_col_norms = get_norms_col_dHf_dc(dHf_dc); % (L x 1)
    dHf_dc_mu_c_iterion(:, i) = mu_c * dJ_dc_col_norms;
    %% get changes for t2s/iter.
    change_t_wrt_iteration = get_dt_diter(mdl_new.t, t_new );
    changes_t(:, i) = change_t_wrt_iteration;
    dHf_diter_col_norms = get_norms_col_dHf_dt(dHf_dt);
    dHf_dt_mu_t_iter(:, i) = mu_t * dHf_diter_col_norms;
    %% update HBF1 model
    mdl_new.c = c_new;
    mdl_new.t = t_new;
    %% Calculate current errors
    current_Hf = compute_Hf_sq_error(X,y, mdl_new, lambda);
    errors_Hfs(i) = current_Hf;
end
if visualize
    %% plot error progression
    figure
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors_Hfs);
    title('Error Hf over iteration -- ');
    %% plot changes in param c
    D = 50
    for l=1:D
        figure
        c_changes_l = changes_c(l,:); % (1 x iterations)
        subplot(2,1,1)
        plot(iteration_axis, c_changes_l)
        title(strcat('delta c/iter -- ', num2str(l)))

        dHf_dc_mu_c = dHf_dc_mu_c_iterion(l,:); % (1 x iterations)
        subplot(2,1,2)
        plot(iteration_axis, dHf_dc_mu_c)
        title(strcat('dJ dc -- ', num2str(l)))
    end
    %% plot changes in param t
    K = 50
    for k=1:K
        figure
        t_changes_k = changes_t(k,:); % (1 x iterations)
        subplot(2,1,1)
        plot(iteration_axis, t_changes_k)
        title(strcat('t/iter -- ', num2str(k)))

        dHf_dt_mu_t = dHf_dt_mu_t_iter(k,:); % (1 x iterations)
        subplot(2,1,2)
        plot(iteration_axis, dHf_dt_mu_t)
        title(strcat('dJ dt -- ', num2str(k)))
    end
end
end
