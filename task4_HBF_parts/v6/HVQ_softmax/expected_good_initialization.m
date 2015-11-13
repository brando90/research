function [ c, t1, t2 ] = expected_good_initialization(list_dict, y, m)
%
[Dp, Dd, Np] = size(list_dict);
K1 = Dd * Np;
K2 = Dd^Np;
t1 = zeros(Dp, Dd, Np);
t1(:,:,1) = list_dict(:,:,1);
t1(:,:,2) = list_dict(:,:,2);
t1(:,:,3) = list_dict(:,:,3); 

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
c = y(1:m:K2*m);
end