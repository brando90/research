%% Comparison of the true parts
%% Prepare
load('data_3parts_Dp10_3slots_divided_by_9_noise');
%% Comparisons
dictd1_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,1)'), normr(list_dict(:,:,1)'))
dictd1_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,1)'), normr(list_dict(:,:,2)'))
dictd1_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,1)'), normr(list_dict(:,:,3)'))

dictd2_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,2)'), normr(list_dict(:,:,1)'))
dictd2_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,2)'), normr(list_dict(:,:,2)'))
dictd2_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,2)'), normr(list_dict(:,:,3)'))

dictd3_dictd1_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,3)'), normr(list_dict(:,:,1)'))
dictd3_dictd2_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,3)'), normr(list_dict(:,:,2)'))
dictd3_dictd3_cosine_similarity = matrix_inner_products_btw_vectors(normr(list_dict(:,:,3)'), normr(list_dict(:,:,3)'))