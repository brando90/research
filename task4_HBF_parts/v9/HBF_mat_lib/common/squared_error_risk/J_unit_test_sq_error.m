%% J unit test
%%
x = (1:3)'/norm(1:3, 2)
c = [17:20;21:24;25:28]'
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]'
beta = 1;
%%
disp('Should be: 29.4221')
y1 = 1;
J_sq_error(x,y1, c,t,beta)