%% Unit test generate supervised all combinations
t1 = 1;
t2 = 2;
N = 2;
dict = [t1 t2];
[Dp, Dd] = size(dict)
dict
all_combinations = generate_supervised_data_all_combinations(dict,N);
all_combinations
[size_all_combinations, number_of_combinations] = size(all_combinations)