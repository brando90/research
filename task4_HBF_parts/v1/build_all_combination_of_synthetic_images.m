function [ X ] = build_all_combination_of_synthetic_images( parts,num_parts,D )
%build_all_combination_of_synthetic_images builds all perm. of P1,...,P4
%   Forms the artificial data set containing all permutations of artificial
%   images.
indices = 1:1:num_parts; %indices for parts
permutations = perms(indices); %all permutations of the indices
[num_perms, ~] = size(permutations);
X = zeros(D,D,num_parts,num_perms); % all the actual permutations of parts
%for every permutation combintation
for index_perm=1:num_perms;
    permutation_list = permutations(index_perm);
    x_perm = zeros(D,D,num_parts);
    %for every index in the current permutation
    for i=permutation_list;
        %get the current part (for the current permutation)
        part_i = parts(i);
        %the actual permutation of the parts for this permutation
        x_perm(:,:,i) = part_i;
    end;
    X(:,:,:,index_perm) = x_perm;
end;
end

