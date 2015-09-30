function [ c, t1, t2 ] = learn_HBF_parameters_2_hidden_layer_iterations(X,y, c,t1,t2,sig, mu_c,mu_t1,mu_t2, lambda, visualize,iterations)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       y = labels (N x 1)

%       C = weights (K2 x L)
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
current_error = compute_Hf(X,y, c,t1,t2, sig, lambda);
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
    %[f_i, z_l1, z_l2, a_l2, a_l3] = f(x_i, c,t1,t2,sig);
    [ h_i, z_l1, z_l2, a_l2, a_l3 ] = h( x_i, c, t1, t2, sig );
    [c_new, ~] = update_c_gradient(c, h_i,y_i, a_l3, mu_c, lambda);
    [t1_new, ~] = update_t1_gradient(t1, h_i,x_i,y_i, z_l1,z_l2,a_l2, c,t2,sig, mu_t1, lambda);
    [t2_new, ~] = update_t2_gradient(t2, h_i,y_i, z_l2,a_l2, c,sig, mu_t2,lambda);
    %% update c's
    c = c_new;
    %% Update t1's
    t1 = t1_new;
    %% Update t2's
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
end