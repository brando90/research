%% generate all data list dict Unit test
%% test 1
% t1 = 1;
% t2 = 2;
% t3 = 3;
% list_dict = [t1, t2, t3];
% [all_combinations, y_labels] = generate_all_data_list_dict(list_dict);
% %% test 2
% t1 = 1;
% t2 = 2;
% t3 = 3;
% t4 = 4;
% t5 = 5;
% t6 = 6;
% list_dict = zeros(1, 3, 2);
% list_dict(:,:,1) = [t1, t2, t3];
% list_dict(:,:,2) = [t4, t5, t6];
% [all_combinations, y_labels] = generate_all_data_list_dict(list_dict);
%%  test 3
list_dict = zeros(1, 3, 2);
list_dict(:,:,1) = [1, 2, 3];
list_dict(:,:,2) = [4, 5, 6];
list_dict(:,:,3) = [7, 8, 9];
[X, y] = generate_all_data_list_dict(list_dict);
X = normc(X);
y = normc(y);
save('data_3parts_3slots_normalized');