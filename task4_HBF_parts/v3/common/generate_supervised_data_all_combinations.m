function [ current_combinations ] = generate_supervised_data_all_combinations(dict, D)
%   D = size of vector
%   dict = dictionary of parts (Dp x Dd)
[Dp, Dd] = size(dict); 
d=0;
prev_combinations = dict;
while d < D
    [m, n] = size(prev_combinations);
    current_combinations = zeros(m+Dp, n*Dd);
    for comb_index=1:length(prev_combinations)
        combination = prev_combinations(:,comb_index);
        for dd=1:Dd
            word = dict(:,dd);
            new_combination = vertcat(combination, word); 
            current_combinations(:,comb_index*Dd+dd) = new_combination;
        end
    end
    prev_combinations = current_combinations;
    d=d+1;
end
    

end

