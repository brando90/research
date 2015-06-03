function [ templates_G ] = generate_memory_based_templates_for_real_images(img_names, G)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
num_imgs = length(img_names);
len_G = length(G);
for i=1:num_imgs;
    name = img_names(i);
    t = imread(name);
    for j=1:len_G;
        gt = act(g, t);
    end
    gt = vectorize(gt);
    templates_G = gt;
end

end

