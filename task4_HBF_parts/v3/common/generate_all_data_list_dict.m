function [all_combinations, y_labels] = generate_all_data_list_dict(list_dict)
%   Inputs:
%       list_dict = dictionary of parts (Dp x Dd x Nd)
%   Output:
%       all_combinations = all combinations of alphabet words (Dp*N, Dp^N)
% Np = number of slots/locations to place a vocab word (1 x 1)
[Dp, Dd, Np] = size(list_dict);
first_dictionary = list_dict(:,:,1);
current_combinations = first_dictionary;
prev_combinations = current_combinations;
if Np==1
    y_labels = (1:Dd^Np)';
    all_combinations = current_combinations;
    return
end
for n=2:Np
    current_dict = list_dict(:,:,n);
    [D_n, N_n] = size(prev_combinations);
    current_combinations = zeros(D_n+Dp, N_n*Dd);
    for comb_index=1:length(prev_combinations);
        combination = prev_combinations(:,comb_index);
        for dd=1:Dd
            word = current_dict(:,dd);
            new_combination = vertcat(combination, word);
            current_combinations(:,(comb_index-1)*Dd+dd) = new_combination;
        end
    end
    prev_combinations = current_combinations;
end
all_combinations = current_combinations;
y_labels = (1:Dd^Np)';
end