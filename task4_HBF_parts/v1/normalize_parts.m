function [ normalized_parts ] = normalize_parts( parts )
%normalize_parts = normalizes parts
%   Given a collection of parts=[p1,...,p_num_parts], makes sure that any 
%   vector made from individual parts is normalized  

% total = 0;
% [~, ~, num_parts] = size(parts);
% for i=1:1:num_parts;
%     part_i = parts(:,:,i);
%     magnitude_p1 = norm(part_i,2);
%     total = total+magnitude_p1;
% end;
% normalized_parts = total;
[D, num_parts] = size(parts);
total = sum(abs(reshape(parts,[D*num_parts,1]) ).^2)^(1/2);
normalized_parts = parts / total;
end

