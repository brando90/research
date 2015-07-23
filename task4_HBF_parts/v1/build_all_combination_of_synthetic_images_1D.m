function [ X_data, X_tensor ] = build_all_combination_of_synthetic_images_1D( parts, num_parts,D )
%build_all_combination_of_synthetic_images builds all perm. of P1,...,P4
%   Forms the artificial data set containing all permutations of artificial
%   images.
indices = 1:num_parts; %indices for parts
permutations = perms(indices); %all permutations of the indices
[num_perms, ~] = size(permutations);
X_tensor = zeros(D,num_parts,num_perms); % all the actual permutations of parts
X_data = zeros(D*num_parts,num_perms);
%for every permutation combintation
for index_perm=1:num_perms
    current_permutation_list = permutations(index_perm, :);
    x_current_perm = zeros(D,num_parts);
    x_current_as_vector = zeros(D*num_parts,1);
    %for every index in the current permutation
    start = 1;
    end_i = start + 1*D - 1;
    for i=1:length(current_permutation_list)
        p_ind = current_permutation_list(i);
        part_i = parts(:, p_ind);
        x_current_perm(:,i) = part_i;
        x_current_as_vector(start:end_i) = part_i;
        start = end_i + 1;
        end_i = start + D - 1;
    end
    if norm((x_current_as_vector), 2) == 0
        X_tensor(:,:,index_perm) = squeeze(x_current_perm);
        X_data(:,index_perm) = x_current_as_vector; 
    else
        X_tensor(:,:,index_perm) = squeeze(x_current_perm)/norm((x_current_as_vector), 2);
        X_data(:,index_perm) = x_current_as_vector/ norm((x_current_as_vector), 2);
    end
end
end

