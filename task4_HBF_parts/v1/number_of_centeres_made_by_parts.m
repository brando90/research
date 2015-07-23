function [ count ] = number_of_centeres_made_by_parts(num_parts, t_centers, t_centers_parts)
%Does there exists, for every center, a concatentation of the smaller parts
%such that, there i (count how many)
count = 0;
[~ ,number_centers_whole] = size(t_centers);
[~,dim_parts, ~] = size(t_centers_parts);
indices = 1:num_parts;
all_perms = perms(indices);
for i=1:number_centers_whole
    t_i = t_centers(:,i);
    for collection_perm_index=1:length(all_perms)
        current_perm = all_perms(collection_perm_index);
        conjuction_vec = zeros(length(t_i),1);
        for j=1:length(current_perm)
            t_centers_parts = t_centers_parts(:,:,j);
            perm_index = current_perm(j);
            current_perm_center = t_centers_parts(perm_index);
            conjuction_vec(j:j+(j-1)*dim_parts, 1) = current_perm_center;
        end
        similarity = dot(conjuction_vec, t_i);
        if 0.8<similarity && similarity <1.1
            count = count + 1;
        end
    end
end
end

