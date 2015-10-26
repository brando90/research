function [ all_combinations, y_labels ] = generate_supervised_data_all_combinations(dict, N)
%   Inputs:
%       dict = dictionary of parts (Dp x Dd)
%       N = number of slots/locations to place a vocab word (1 x 1)
%   Output:
%       all_combinations = all combinations of alphabet words (Dp*N, Dp^N)
[Dp, Dd] = size(dict); 
current_combinations = dict;
prev_combinations = current_combinations;
for n=2:N
    [D_n, N_n] = size(prev_combinations);
    current_combinations = zeros(D_n+Dp, N_n*Dd);
    for comb_index=1:length(prev_combinations);
        combination = prev_combinations(:,comb_index);
        for dd=1:Dd
            word = dict(:,dd);
            new_combination = vertcat(combination, word);
            current_combinations(:,(comb_index-1)*Dd+dd) = new_combination;
        end
    end
    prev_combinations = current_combinations;
end
all_combinations = current_combinations;
y_labels = (1:Dp^N)';
end