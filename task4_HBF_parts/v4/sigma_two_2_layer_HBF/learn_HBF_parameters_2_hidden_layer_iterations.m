function [ c, t1, t2 ] = learn_HBF_parameters_2_hidden_layer_iterations(X,y, c,t1,t2,sig, mu_c,mu_t1,mu_t2, lambda, visualize,iterations)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       y = labels (N x 1)

%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%       sig = sigma (1 x 1)

%       mu_c = (1 x 1)
%       mu_t1 = (1 x 1)
%       mu_t2 = (1 x 1)

%       lambda = regularization param (1 x 1)
%       visualize = whether to plot the error or not. (1 x 1)
%       iterations = number of iterations (1 x 1)

%   Outputs:
%       C = weights (K_2 x L)
%       t1 = centers (K_1 x K_2)
%       t2 = centers (D_p x D_d x N_p)
[~, N] = size(X);
[K2, L] = size(c);
[~, Dd, Np] = size(t1);
current_error = compute_Hf(X,y, c,t1,t2, sig, lambda);
errors = cell(1,1);
errors{1,1} = current_error;
changes_c = zeros(L, iterations);
dJ_dc_mu_c_iter = zeros(L, iterations);
changes_t1 = zeros(Dd*Np, iterations);
dJ_dt1_mu_t1_iter = zeros(Dd*Np, iterations);
changes_t2 = zeros(K2, iterations);
dJ_dt2_mu_t2_iter = zeros(K2, iterations);
for i=1:iterations
    %% choose random data point x,y
    i_rand = randi(N);
    x_i = X(:,i_rand);
    y_i = y(i_rand);
    %% get new parameters
    [ h_i, z_l1, z_l2, a_l2, a_l3 ] = h( x_i, c, t1, t2, sig );
    [c_new, dJ_dc] = update_c_gradient(c, h_i,y_i, a_l3, mu_c, lambda);
    [t1_new, dJ_dt1] = update_t1_gradient(t1, h_i,x_i,y_i, z_l1,z_l2,a_l2, c,t2,sig, mu_t1, lambda);
    [t2_new, dJ_dt2] = update_t2_gradient(t2, h_i,y_i, z_l2,a_l2, c,sig, mu_t2,lambda);
    %% get plotting info about parameters
    % get changes for c/iter.
    change_c_wrt_current_iteration = get_dc_dt(c, c_new); % (L x 1)
    changes_c(:,i) = change_c_wrt_current_iteration; % (L x 1)
    dJ_dc_col_norms = get_norms_col_dJ_dc(dJ_dc); % (L x 1)
    dJ_dc_mu_c_iter(:, i) = mu_c * dJ_dc_col_norms;
    %% get changes for t1s/iter.
    change_t1_wrt_iteration = get_dt1_dt(t1, t1_new);
    distances = reshape(change_t1_wrt_iteration, Dd*Np, 1);
    changes_t1(:, i) = distances;
    dJ_dt1_col_norms = get_norms_col_dJ_dt1(dJ_dt1);
    dJ_dt1_col_norms_reshaped = reshape(dJ_dt1_col_norms, Dd*Np, 1);
    dJ_dt1_mu_t1_iter(:,i) = mu_t1 * dJ_dt1_col_norms_reshaped;
    %% get changes for t2s/iter.
    change_t2_wrt_iteration = get_dt2_dt(t2, t2_new );
    changes_t2(:, i) = change_t2_wrt_iteration;
    dJ_dt2_col_norms = get_norms_col_dJ_dt2(dJ_dt2);
    dJ_dt2_mu_t2_iter(:, i) = mu_t2 * dJ_dt2_col_norms;
    %% Update parameters
    % update c's
    c = c_new;
    % Update t1's
    t1 = t1_new;
    % Update t2's
    t2 = t2_new;
    %% update errors
    %prev_error = current_error;
    current_error = compute_Hf(X,y, c,t1,t2, sig, lambda);
    if isnan(current_error)
        keyboard
    end
    errors{i} = current_error;
    %i = i + 1;
end
if visualize
    %% plot change in training error
    figure
    errors = cell2mat(errors);
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors );
    %% plot changes in param c
%     for l=1:L
%         figure
%         c_changes_l = changes_c(l,:); % (1 x iterations)
%         subplot(2,1,1)
%         plot(iteration_axis, c_changes_l)
%         title(strcat('c/iter -- ', num2str(l)))
%         
%         dJ_dc_mu_c = dJ_dc_mu_c_iter(l,:); % (1 x iterations)
%         subplot(2,1,2)
%         plot(iteration_axis, dJ_dc_mu_c)
%         title(strcat('dJ dc -- ', num2str(l))) 
%     end   
%     %% plot change in param t1
%     for ddnp=1:(Dd*Np)
%         figure
%         t1_changes_ddnp = changes_t1(ddnp,:); % (1 x iterations)
%         subplot(2,1,1)
%         plot(iteration_axis,t1_changes_ddnp)
%         title(strcat('t1/iter -- ', num2str(ddnp) ) )
%         
%         dJ_dt1_mu_t1 = dJ_dt1_mu_t1_iter(ddnp,:);
%         subplot(2,1,2)
%         plot(iteration_axis,dJ_dt1_mu_t1)
%         title(strcat('dJ t1 -- ', num2str(ddnp) ) )
%     end
%     %% plot changes in param t2
%     for k2=1:K2
%         figure
%         t2_changes_k2 = changes_t2(k2,:); % (1 x iterations)
%         subplot(2,1,1)
%         plot(iteration_axis, t2_changes_k2)
%         title(strcat('t2/iter -- ', num2str(k2)))
%         
%         dJ_dt2_mu_t2 = dJ_dt2_mu_t2_iter(k2,:); % (1 x iterations)
%         subplot(2,1,2)
%         plot(iteration_axis, dJ_dt2_mu_t2)
%         title(strcat('dJ dt2 -- ', num2str(k2))) 
%     end
end