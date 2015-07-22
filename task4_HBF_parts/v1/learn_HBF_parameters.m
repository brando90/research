function [ C, T ] = learn_HBF_parameters( X_data, Y, C_weights, t_centers )
%get_HBF_parameters = get C's, t's assuming M=I
%   get C's, t's by gradient descent assuming M=I
%   X_data = (dim_data, num_data)=(Dxnum_parts,N)
[D, N] = size(X_data); %D=dim of data, N=num of data points
[K, ~] = size(t_centers); %K = number of hidden units
C = zeros(K, D);
T = zeros(D,K);
[F_star, ~] = f_star_all_data(x, C_weights, t_centers);
meu = 0.6;
for iteration=1:100
    %update weight c_k,j
    X_data_t = X_data.';
    delta = Y - F_star;
    for j=1:K
        for k=1:D
            c_kj = C_weights(k,j);
            total_change = 0;
            for i=1:N;
                x_i = X_data(:, i);
                t_k = t_centers(:,k);
                delta_i = delta(j,i);
                G_xi_tk = exp(-1*norm(x_i - t_k)^2);
                total_change = total_change + delta_i*(-2)*G_xi_tk;
            end
            c_kj = c_kj - meu*(total_change);
            C(k,j) = c_kj;
        end
    end
    %update center t_k
    for k=1:K
        t_k = t_centers(k);
        c_k = C_weights(k,:);
        for i=1:N
            delta_i = norm(delta(i), 2)^2;
            
        end
    end
end
end

