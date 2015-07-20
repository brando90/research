function [ X ] = build_all_combination_of_synthetic_images( parts,num_parts,D )
%build_all_combination_of_synthetic_images builds all perm. of P1,...,P4
%   Forms the artificial data set containing all permutations of artificial
%   images.
indices = 1:1:num_parts;
permutations = perms(indices);
for index_perm=1:permutations;
    permutation_list = permutations(index_perm);
    x_p = zeros(D,D,num_parts);
    for i=permutation_list;
        part_i = parts(i);
        x_p(:,:,i) = part_i;
    end;  
end;
end

