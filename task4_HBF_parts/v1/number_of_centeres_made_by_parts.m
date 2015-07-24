function [ all_match_vectors, all_number_of_matches ] = number_of_centeres_made_by_parts(num_parts, t_centers, t_centers_parts_collection, tau)
%Does there exists, for every center, a concatentation of the smaller parts
%such that, there i (count how many)
[~, number_centers_whole] = size(t_centers);
[dim_parts, ~, ~] = size(t_centers_parts_collection);
indices = 1:num_parts;
all_perms = perms(indices);
all_match_vectors = zeros(length(all_perms), number_centers_whole);
all_number_of_matches = zeros(1, number_centers_whole);
for i=1:number_centers_whole
    t_i = t_centers(:,i);
    for collection_perm_index=1:length(all_perms)
        current_perm = all_perms(collection_perm_index,:);
        conjuction_vec = zeros(length(t_i),1);
        start = 1;
        end_i = start + 1*dim_parts - 1;
        for j=1:length(current_perm)
            t_centers_parts = t_centers_parts_collection(:,:,j);
            perm_index = current_perm(j);
            current_perm_center = t_centers_parts(:,perm_index);
            conjuction_vec(start:end_i) = current_perm_center;
            start = end_i + 1;
            end_i = start + dim_parts - 1;
        end
        similarity = dot(conjuction_vec, t_i);
        if tau<similarity && similarity <1.1
            all_match_vectors(collection_perm_index,i) = 1;
        end
    end
    all_number_of_matches(i) = nnz(all_match_vectors(:,i));
end
end

