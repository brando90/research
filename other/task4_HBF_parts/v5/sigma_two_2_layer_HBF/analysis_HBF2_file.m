%% File that does comparisons 2HBF
%% Prepare
addpath('../common')
load('most_recent_state_of_HBF2_run')
%% Comparisons
c_2hbf_cosine_similarity = matrix_inner_products_btw_vectors(normr(c_2hbf') , normr(y(1:m:m*K2)') )
%compare with all the other parts, compare the learned centers with all the
%other parts
disp('1st t1 centers learned comparison')
t1p1_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,1)'), normr(list_dict(:,:,1)'));
t1p1_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,1)'), normr(list_dict(:,:,2)'));
t1p1_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,1)'), normr(list_dict(:,:,3)'));
disp('2nd t1 centers learned comparison')
t1p2_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,2)'), normr(list_dict(:,:,1)'));
t1p2_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,2)'), normr(list_dict(:,:,2)'));
t1p2_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,2)'), normr(list_dict(:,:,3)'));
disp('3rd t1 centers learned comparison')
t1p3_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,3)'), normr(list_dict(:,:,1)'));
t1p3_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,3)'), normr(list_dict(:,:,2)'));
t1p3_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(t1(:,:,3)'), normr(list_dict(:,:,3)'));

threshold = 0.8

A = [t1p1_dictd1_cosine_similarity, t1p1_dictd2_cosine_similarity, t1p1_dictd3_cosine_similarity]
B = [t1p2_dictd1_cosine_similarity, t1p2_dictd2_cosine_similarity, t1p2_dictd3_cosine_similarity]
C = [t1p3_dictd1_cosine_similarity, t1p3_dictd2_cosine_similarity, t1p3_dictd3_cosine_similarity]
all = [A; B; C] > threshold

% disp('1st t1 centers learned comparison')
% sum(t1p1_dictd1_cosine_similarity' > threshold)'
% sum(t1p1_dictd2_cosine_similarity' > threshold)'
% sum(t1p1_dictd3_cosine_similarity' > threshold)'
% disp('2nd t1 centers learned comparison')
% sum(t1p2_dictd1_cosine_similarity' > threshold)'
% sum(t1p2_dictd2_cosine_similarity' > threshold)'
% sum(t1p2_dictd3_cosine_similarity' > threshold)'
% disp('3rd t1 centers learned comparison')
% sum(t1p3_dictd1_cosine_similarity' > threshold)'
% sum(t1p3_dictd2_cosine_similarity' > threshold)'
% sum(t1p3_dictd3_cosine_similarity' > threshold)'

%t2_cosine_similarity = matrix_inner_products_btw_vectors(normr(t2'), normr(t2_expected') )