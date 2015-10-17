%% most similar parts
list_dict = zeros(10, 3, 3);
t1_1 = repmat([1 0],1,5)'
t1_2 = (1:10)'/norm(1:10,2)
t1_3 = sin(0:2*0.3142:2*3.1416)'
t2_1 = cos(0:2*0.3142:2*3.1416)'
t2_2 = repmat(1,1,10)'/10
t2_3 = power(1:10,2)'/norm(power(1:10,2),2)
t3_1 = exp(-[1:10])'
t3_2 = arrayfun(@(t)( ((-1)^t)*t ), 1:10)'/norm(arrayfun(@(t)( ((-1)^t)*t ), 1:10)',2)
t3_3 = log(0.4:0.2:2.3)'
list_dict(:,:,1) = [t1_1, t1_2, t1_3];
list_dict(:,:,2) = [t2_1, t2_2, t2_3];
list_dict(:,:,3) = [t3_1, t3_2, t3_3];
[X_perfect_data, y] = generate_all_data_list_dict(list_dict);
size(X_perfect_data);
%% compare inner products
[~, N] = size(X_perfect_data)
inner_prods = zeros(N, N);
normc(X_perfect_data);
for i=1:N
    data_i = X_perfect_data(:,i);
    for j=1:N
        data_j = X_perfect_data(:,j);
        inner_prods(i,j) = data_i' * data_j;
    end
end
inner_prods
for i=1:N
    inner_prods(i,i) = inf;
end
[min_val, I] = min(min(inner_prods))
inner_prods(10,27)
issymmetric(inner_prods)
%% lest similar 10 and 27