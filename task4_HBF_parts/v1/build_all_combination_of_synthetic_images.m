function [ X ] = build_all_combination_of_synthetic_images( parts,num_parts,D )
%build_all_combination_of_synthetic_images builds all perm. of P1,...,P4
%   Forms the artificial data set containing all permutations of artificial
%   images.
x = zeros(D*num_parts);
for i=1:num_parts;
    pi = parts(i);
    indices = 1:num_parts;
    indices = indices(indices~=i);
    for j=indices;
        pj = parts(j);
        indices = indices(indices~=j);
        for k=indices;
            pk = parts(k);
            indices = indices(indices~=k);
            for l=indices;
                pl = parts(l);
                indices = indices(indices~=k);
            end;
        end;
    end;  
end;


end

