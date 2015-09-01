%% generate all data list dict Unit test
%% test 1
% t1 = 1;
% t2 = 2;
% t3 = 3;
% list_dict = [t1, t2, t3];
% [all_combinations, y_labels] = generate_all_data_list_dict(list_dict);
% %% test 2
% t1 = 1;
% t2 = 2;zx
% t3 = 3;
% t4 = 4;
% t5 = 5;
% t6 = 6;
% list_dict = zeros(1, 3, 2);
% list_dict(:,:,1) = [t1, t2, t3];
% list_dict(:,:,2) = [t4, t5, t6];
% [all_combinations, y_labels] = generate_all_data_list_dict(list_dict);
% %%  test 3
% list_dict = zeros(1, 3, 2);
% % list_dict(:,:,1) = [1, 2, 3]/9;
% % list_dict(:,:,2) = [4, 5, 6]/9;
% % list_dict(:,:,3) = [7, 8, 9]/9;
% list_dict(:,:,1) = [1, 2, 3]/9;
% list_dict(:,:,2) = [4, 5, 6]/9;
% list_dict(:,:,3) = [7, 8, 9]/9;
% % list_dict(:,:,1) = [1, 2, 3];
% % list_dict(:,:,2) = [4, 5, 6];
% % list_dict(:,:,3) = [7, 8, 9];
% [X, y] = generate_all_data_list_dict(list_dict);
% %X = normc(X);
% y = normc(y);
% [X y] = replicate_data_with_noise(X, y, 5)
% save('data_3parts_3slots_divided_by_9_noise');
% %replicate_data_with_noise(list_dict, 5)
%% test 4
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
% list_dict(:,:,1) = [1, 2, 3];
% list_dict(:,:,2) = [4, 5, 6];
% list_dict(:,:,3) = [7, 8, 9];
[X_perfect_data, y] = generate_all_data_list_dict(list_dict);
%X = normc(X);
X_perfect_data
y = normc(y)
size(X_perfect_data)
size(y)
m = 20;
[X, y] = replicate_data_with_noise(X_perfect_data, y, m)
%save('data_3parts_Dp10_3slots_divided_by_9_noise_snr_1');
save('data_3parts_Dp10_3slots_divided_by_9_noise_snr_1_TEST_DATA');
size(X)
size(y)
%replicate_data_with_noise(list_dict, 5)