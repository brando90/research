function [ c, t1, t2 ] = learn_HBF_parameters_2_hidden_layer(X,Y,c,t1,t2,lambda,mu_c,mu_t2,mu_t1,prec,visualize)
%learn_HBF_parameters_1_hidden_later - learns HBF params for 2 layers
%   Inputs:
%       X = data matrix (D x N)
%       Y = labels (N x 1)
%       c = weights (K2 x 1)
%       t2 = centers (Dp x Dd x Np)
%       t1 = centers (K1 x K2)
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
[Dp, ~, ~] = size(t2);
current_error = compute_Hf(X, Y, c, t, lambda);
prev_error = inf;
i = 1;
errors = cell(1,1);
errors{1,1} = current_error;
%while the current error is too large
while abs(current_error - prev_error) > prec
    %% choose random data point x,y
    i_rand = randi(N);
    x = X(:,i_rand);
    y = Y(i_rand);
    %% Update parameters
    [f, z_l1, z_l2, a_l2, a_l3] = f_star(x,c,t_1,t_2,Np,Dp);
    c_new = update_c_gradient(c,y,f,a_l3,lambda,mu_c);
    t1_new = update_t1_gradient(t1,c,x,y,f,z_l1,z_l2,a_l2,a_l3,lambda, mu_t1);
    t2_new = update_t2_gradient(t2,x,y,f,z_l1,z_l2,a_l2,a_l3,lambda, mu_t2);
    c =c_new;
    t1 = t1_new;
    t2 = t2_new;
    %% update errors
    prev_error = current_error;
    current_error = compute_Hf(X, Y, c, t, lambda);
    errors{i} = current_error;
    i = i + 1;
end
if visualize
    errors = cell2mat(errors);
    iteration_axis = 1:length(errors);
    plot(iteration_axis, errors );
end
end

