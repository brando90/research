%% generate all data list dict Unit test
%% test 1
Dp = 10
Dd = 4
Np = 3
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
%X = normc(X);
size(X_perfect_data)
size(y)
m_train = 10;
[X_training_data,y_training_data] = replicate_data_with_noise(X_perfect_data, y, m_train);
[~, N_size_training_data] = size(X_training_data)
m_test = 500;
[X_test_data,y_test_data] = replicate_data_with_noise(X_perfect_data, y, m_train);
[~, N_size_test_data] = size(X_test_data)
save('data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');