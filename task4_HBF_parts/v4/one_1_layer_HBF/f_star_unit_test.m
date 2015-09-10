%% f star unit test
x = (1:3)'/norm(1:3, 2)
c = [17:20]'
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]'
disp('Should be 67.95');
f_star(x,c,t)