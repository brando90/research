%% number_of_centeres_made_by_parts
num_parts = 4;
K_part = 4;
%% make centers parts
t1 = [1;2;3];
t2 = [4;5;6];
t3 = [7;8;9];
t4 = [10;11;12];
[dim_part, ~] = size(t1);
%% make centers for whole
t1_whole = [t1; t2; t3; t4];
length_t1_whole = norm(t1_whole, 2);
t1_whole = t1_whole/length_t1_whole;
t2_whole = [zeros(size(t1)); zeros(size(t1)); zeros(size(t1)); zeros(size(t1))];
%% centers for parts and whole
centers_parts = [t1 t2 t3 t4]/length_t1_whole; % dim_parts x num_parts
centers_whole = [t1_whole t2_whole];
%% centers for all parts (collect centers for parts)
centers_parts_collection = zeros(dim_part,K_part,num_parts);
for i=1:num_parts
    centers_parts_collection(:,:,i) = centers_parts;
end
%% what the similarity of t_1 to itself
similarity = dot(t1_whole, t1_whole);
disp(similarity);
%% test the number of centers made by parts
count = number_of_centeres_made_by_parts(num_parts, centers_whole, centers_parts_collection);
disp(count);