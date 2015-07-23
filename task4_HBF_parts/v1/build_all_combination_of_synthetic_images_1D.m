function [ X_data, X_tensor ] = build_all_combination_of_synthetic_images_1D( parts, num_parts,D )
%build_all_combination_of_synthetic_images builds all perm. of P1,...,P4
%   Forms the artificial data set containing all permutations of artificial
%   images.
indices = 1:1:num_parts; %indices for parts
permutations = perms(indices); %all permutations of the indices
[num_perms, ~] = size(permutations);
X_tensor = zeros(D,num_parts,num_perms); % all the actual permutations of parts
X_data = zeros(D*num_parts,num_perms);
%for every permutation combintation
for index_perm=1:num_perms
    current_permutation_list = permutations(index_perm);
    x_current_perm = zeros(D,1,num_parts);
    x_current_as_vector = zeros(1,D*num_parts);
    %for every index in the current permutation
    start = 1;
    for i=current_permutation_list
        %get the current part (for the current permutation)
        part_i = parts(i);
        %the actual permutation of the parts for this permutation
        x_current_perm(:,i) = part_i; %[p_i1, p_i2, p_i3, p_i4]
        x_current_as_vector(:,start + (i-1)*D) = part_i;
    end
    disp('norm')
    norm((x_current_as_vector), 2)
    x_current_perm
    X_tensor(:,:,index_perm) = squeeze(x_current_perm)/norm((x_current_as_vector), 2);
    X_data(:,index_perm) = x_current_as_vector/ norm((x_current_as_vector), 2);
end;
end

