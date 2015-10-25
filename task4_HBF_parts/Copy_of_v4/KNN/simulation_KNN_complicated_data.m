%% KNN of complicated data
%load('../common/data_3parts_Dp10_3slots_divided_by_9_noise_snr_1')
x1 =[1, 1];
x2 = [-1, -1];
x3 = [-2, -2];
y1 = 1;
y2 = -1;
y3 = -1;
X = repmat([x1; x2; x3],1000,1);
Y = repmat([y1; y2; y3],1000,1);
size(X)
size(Y)
mdl = fitcknn(X,Y);
mdl.predict([1, 1])
mdl.predict([-1,-1])
disp('end!!!!');