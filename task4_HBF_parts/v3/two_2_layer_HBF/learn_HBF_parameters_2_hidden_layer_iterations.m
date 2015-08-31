function [ c, t1, t2 ] = learn_HBF_parameters_2_hidden_layer_iterations(X,y,c,t1,t2,lambda,mu_c,mu_t2,mu_t1,visualize, iterations)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K2 x 1)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%       lambda = regularization param (1 x 1)
%       mu_c = (1 x 1)
%       mu_t1 = (1 x 1)
%       mu_t2 = (1 x 1)
%       prec = precision of Hf vs Hf* (1 x 1)
%       visualize = whether to plot the error or not.
%   Outputs:
%       c = weights (K_2 x 1)
%       t1 = centers (K_1 x K_2)
%       t2 = centers (D_p x D_d x N_p)
[~, N] = size(X);
%[Dp, ~, Np] = size(t1);
current_error = compute_Hf(X,y,c,t1,t2,lambda);
%prev_error = inf;
%i = 1;
errors = cell(1,1);
errors{1,1} = current_error;
%while the current error is too large
[~, Dd, Np] = size(t1);
K2 = length(c);
changes_c = zeros(K2, iterations);
changes_t1 = zeros(Dd*Np, iterations);
changes_t2 = zeros(K2, iterations);
for i=1:iterations
    %% choose random data point x,y
    i_rand = randi(N);
    x_i = X(:,i_rand);
    y_i = y(i_rand);
    %% get new parameters
    [f, z_l1, z_l2, a_l2, a_l3] = f_star(x_i,c,t1,t2);
    c_new = update_c_gradient(c,i,f,a_l3,lambda,mu_c);
    t1_new = update_t1_gradient(t1,x_i,y_i,f,z_l1,z_l2,a_l2,c,t2,lambda,mu_t1);
    t2_new = update_t2_gradient(t2,c,y_i,f,z_l2,a_l2,lambda,mu_t2);
    %% get changes for c/iter.
    c = c_new;
    changes_c(:, i) = c_new - c;
    %% get changes for t1s/iter.
    change_t1_wrt_iteration = get_dt1_dt(t1, t1_new);
    distances = reshape(change_t1_wrt_iteration, Dd*Np, 1);
    changes_t1(:, i) = distances;
    %% get changes for t2s/iter.
    change_t2_wrt_iteration = get_dt2_dt(t2, t2_new );
    changes_t2(:, i) = change_t2_wrt_iteration;
    %% Update t1's
    t1 = t1_new;
    %% Update t2's
    t2 = t2_new;
    %% update errors
    %prev_error = current_error;
    current_error = compute_Hf(X,y,c,t1_new,t2_new,lambda);
    errors{i} = current_error;
    %i = i + 1;
end
if visualize
    %% plot change in training error
    figure
    errors = cell2mat(errors);
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors );
    % plot change in param c
    %% plot changes in param c
    for k2=1:K2
        c_changes_i = changes_c(k2,:); % (1 x iterations)
        %subplot(K2,1,k2)
        figure
        plot(iteration_axis,c_changes_i)
        title(strcat('c-- ', num2str(k2) ) )
    end
    %% plot change in param t1
    figure
    for ddnp=1:(Dd*Np)
        t1_changes_ddnp = changes_t1(ddnp,:); % (1 x iterations)
        subplot(Dd,Np,ddnp)
        plot(iteration_axis,t1_changes_ddnp)
        title(strcat('t1-- ', num2str(ddnp) ) )
    end
    %% plot changes in param t2
    for k2=1:K2
        t2_changes_k2 = changes_t2(k2,:); % (1 x iterations)
        figure
        plot(iteration_axis,t2_changes_k2)
        title(strcat('t2-- ', num2str(k2))) 
    end
end
end