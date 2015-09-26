function [ h_x, z_l1, z_l2,a_l2,a_l3 ] = h( x, c, t1, t2, sig )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[z_l1, z_l2,a_l2,a_l3] = forward_pass(x, c, t1, t2, sig);
h_x = c' * a_l3;
end