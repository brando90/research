function [ mdl_params ] = learn_RBF_batch_GD(Xtrain,ytrain, mdl_params, iterations,visualize, Xtest,Ytest)
% learn_HBF_parameters_1_hidden_later - learns HBF params from Poggio's Paper
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%   Outputs:
%       c_new = learned weights (K x 1)
[D, ~] = size(ytrain);
if visualize
    errors_Hfs = zeros(iterations,1);
    errors_Test = zeros(iterations,1);
    changes_c = zeros(D, iterations);
    dHf_dc_mu_c_iterion = zeros(D, iterations);
end
Kern = produce_kernel_matrix(Xtrain,mdl_params.t,mdl_params.beta ); % (N x N)
for i=1:iterations
    %% get new parameters
    [c_new, dHf_dc, mu_c] = update_c_batch(Kern,ytrain, mdl_params);
    if visualize
        %% get changes for c/iter.
        change_c_wrt_current_iteration = get_dc_diter(mdl_params.c, c_new); % (L x 1)
        changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
        dJ_dc_col_norms = get_norms_col_dHf_dc(dHf_dc); % (L x 1)
        dHf_dc_mu_c_iterion(:, i) = mu_c * dJ_dc_col_norms;
    end
    %% update RBF model
    mdl_params.c = c_new;
    %% Calculate current errors
    if visualize
        mdl_new = RBF(mdl_params);
        current_Hf = compute_Hf_sq_error(Xtrain,ytrain, mdl_new, mdl_params.lambda);
        current_Hf_test = compute_Hf_sq_error(Xtest,Ytest, mdl_new, mdl_params.lambda);
        errors_Hfs(i) = current_Hf;
        errors_Test(i) = current_Hf_test;
    end
end
if visualize
    %% plot error progression
    figure
    start = 3;
    iteration_axis = start:iterations;
    plot(iteration_axis, errors_Hfs(iteration_axis));
%     plot(iteration_axis,errors_Hfs,'-ro',iteration_axis, errors_Test,'-b*');
%     legend('Training risk','Test risk');
    subplot(2,1,1)
    plot(iteration_axis,errors_Hfs(iteration_axis),'-ro');
    legend('Training risk');
    subplot(2,1,2)
    plot(iteration_axis, errors_Test(iteration_axis),'-b*');
    legend('Test risk');
    title('Train and Test risk over iteration -- ');
    %% plot changes in param c
    D = min(D,50);
    for l=1:D
        figure
        c_changes_l = changes_c(l,:); % (1 x iterations)
        subplot(2,1,1)
        plot(iteration_axis, c_changes_l(iteration_axis) )
        title(strcat('delta c/iter -- ', num2str(l)))

        dHf_dc_mu_c = dHf_dc_mu_c_iterion(l,:); % (1 x iterations)
        subplot(2,1,2)
        plot(iteration_axis, dHf_dc_mu_c(iteration_axis) )
        title(strcat('dJ dc -- ', num2str(l)))
    end
end
end
