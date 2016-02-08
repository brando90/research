%% Inner products Unit test
M1 = [ 1 2 3 1; 4 5 6 1; 7 8 9 1]
M2 = [8 1 6 1; 3 5 7 1; 4 9 2 1] 
%first row should be [29 35 29]
W = matrix_inner_products_btw_vectors(M1, M2)