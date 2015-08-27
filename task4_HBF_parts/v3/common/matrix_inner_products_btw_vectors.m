function [ W ] = matrix_inner_products_btw_vectors( M1, M2 )
%computes matrix of innter products
%   Inputs:
%       M1 = first set of vectors (m1 x N)
%       M2 = second set of vectors (m2 N)
%   Outputs:
%       W = matrix of innter products (m1 x m2)
[m1, ~] = size(M1);
[m2, ~] = size(M2);
W = zeros(m1, m2);
for i_m1=1:m1
    M1_m1 = M1(i_m1, :); %(1 x N)
   for i_m2=1:m2
       M2_m2 = M2(i_m2, :); %(1 x N)
       W(i_m1, i_m2) = M1_m1 * M2_m2';
   end
end
end