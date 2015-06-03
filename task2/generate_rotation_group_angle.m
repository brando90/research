function [ G_R ] = generate_rotation_group_angle( delta_angle )
% size_group = 360.0/delta_angle;
% angles = 0;delta_angle:360;
% G = zeros(2, 2 , size_group);
% for theta=angles;
%     R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
%     
% end
G_R = 0:delta_angle:360;
G_R = G_R(1:359);
end

