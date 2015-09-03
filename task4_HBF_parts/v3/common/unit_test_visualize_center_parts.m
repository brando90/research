%% Visualize parts unit test
% Np = 3;
% Dp = 10;
% list_dict = zeros(10, 3, 3);
% t1_1 = repmat([1 0],1,5)'
% t1_2 = (1:10)'/norm(1:10,2)
% t1_3 = sin(0:2*0.3142:2*3.1416)'
% t2_1 = cos(0:2*0.3142:2*3.1416)'
% t2_2 = repmat(1,1,10)'/10
% t2_3 = power(1:10,2)'/norm(power(1:10,2),2)
% t3_1 = exp(-[1:10])'
% t3_2 = arrayfun(@(t)( ((-1)^t)*t ), 1:10)'/norm(arrayfun(@(t)( ((-1)^t)*t ), 1:10)',2)
% t3_3 = log(0.4:0.2:2.3)'
% list_dict(:,:,1) = [t1_1, t1_2, t1_3];
% list_dict(:,:,2) = [t2_1, t2_2, t2_3];
% list_dict(:,:,3) = [t3_1, t3_2, t3_3];
% visualize_center_parts(list_dict(:,:,1));
%%
Np = 3;
Dp = 10;
list_dict = zeros(10, 3, 3);
t1_1 = repmat([1 0],1,5)';
t1_2 = (1:10)'/norm(1:10,2);
t1_3 = sin(0:2*0.3142:2*3.1416)';
list_dict(:,:,1) = [t1_1, t1_2, t1_3];
visualize_center_parts(list_dict(:,:,1));