function [ c, t1, t2 ] = expected_parameter_learning_tommys_example(Dp, Dd, Np, K1, K2)
%
t1 = zeros(Dp, Dd, Np);
t1(:,:,1) = [1, 2, 3]/9;
t1(:,:,2) = [4, 5, 6]/9;
t1(:,:,3) = [7, 8, 9]/9; 

t2_temp = zeros([K1, 1]);
t2 = zeros([0]);
for i1=1:3
    t2_temp = zeros([K1, 1]);
    t2_temp(i1) = 1/3;
    for i2=4:6
        t2_temp(i2) = 1/3;
        for i3=7:9
            t2_temp(i3) = 1/3;
            t2 = [t2 t2_temp];
            t2_temp(i3) = 0;
        end
        t2_temp(i2) = 0;
    end
    t2_temp(i1) = 0;
end
c = normc((1:K2)');
end