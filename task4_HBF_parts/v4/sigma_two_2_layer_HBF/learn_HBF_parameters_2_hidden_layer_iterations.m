function [ C, t1, t2 ] = learn_HBF_parameters_2_hidden_layer_iterations(X,y, C,t1,t2,sig, mu_c,mu_t1,mu_t2, lambda, visualize, iterations)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K2 x L)
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
current_error = compute_Hf(X,y, C,t1,t2, sig, lambda);
errors = cell(1,1);
errors{1,1} = current_error;
%[~, Dd, Np] = size(t1);
%K2 = length(C);
for i=1:iterations
    %% choose random data point x,y
    i_rand = randi(N);
    x_i = X(:,i_rand);
    y_i = y(i_rand);
    %% get new parameters
    [f_i, z_l1_p, z_l2_p, a_l2, a_l3] = f(x_i, C,t1,t2,sig);
    [C_new, ~] = update_c_gradient(C, f_i,y_i, a_l3, mu_c, lambda);
    [t1_new, ~] = update_t1_gradient(t1, f_i,x_i,y_i, z_l1_p,z_l2_p,a_l2, C,t2,sig, mu_t1, lambda);
    [t2_new, ~] = update_t2_gradient(t2, f_i,y_i, z_l2_p,a_l2, C,sig, mu_t2,lambda);
    %% update c's
    C = C_new;
    %% Update t1's
    t1 = t1_new;
    %% Update t2's
    t2 = t2_new;
    %% update errors
    %prev_error = current_error;
    current_error = compute_Hf(X,y, C,t1,t2, sig, lambda);
    errors{i} = current_error;
    %i = i + 1;
end
if visualize
    %% plot change in training error
    figure
    errors = cell2mat(errors);
    iteration_axis = 1:iterations;
    plot(iteration_axis, errors );
end