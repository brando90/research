%% File that does comparisons HBF 1
%% Prepare
addpath('../common')
load('most_recent_state_of_HBF1_run')
%% Comparisons
% compare learned c's with initialized c's (expect best?)
weights_cosine_similarity = matrix_inner_products_btw_vectors(normr(c') , normr(y(1:m:m*K)') )
% compare learned centers with initialized centers
%center_cosine_similarity = matrix_inner_products_btw_vectors(normr(t'), normr(X(:,1:m:m*K)') )
center_cosine_similarity = matrix_inner_products_btw_vectors(normr(t'), normr(X(:,1:m:m*K)') )

dimension_of_weights_cosine_similarity = size(weights_cosine_similarity)
dimension_of_centers_consine_similarity = size(center_cosine_similarity)

disp('-- were the weights learned close to truth?')
agreement_with_weights = sum(weights_cosine_similarity > 0.6)
disp('-- number of agreements of ceneters learned with the original centers per center')
agreement_for_centers_per_center = sum(center_cosine_similarity > 0.6)
disp('-- total number of centers that exceeded 0.6')
agreement_for_centers = sum(sum(center_cosine_similarity > 0.6))