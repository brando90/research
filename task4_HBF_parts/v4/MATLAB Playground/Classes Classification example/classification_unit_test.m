%% classify unit test
disp('Test 1');
y = [1,1,1,1];
y_predictions = [1 2 3 4];
error = classification_error( y, y_predictions );
disp('classification_error should be: 3');
disp(error)
%% Test1
% dimensions
disp('Test 2');
% fake data & params
x = [1, 2, 3, 4, 5, 6]'/norm([1, 2, 3, 4, 5, 6],2);
y = 3;
sig = 1;
c = [29, 30, 31, 32; 33, 34, 35, 36 ; 37, 38, 39, 40]';
% t1data = {{Range[1, 3]/Norm[Range[1, 3], 2], Range[4, 6]/Norm[Range[4, 6], 2]}, {Range[7, 9]/ Norm[Range[7, 9], 2], Range[10, 12]/Norm[Range[10, 12], 2]}}
%t1 = rand(Dp, Dd, Np);
t1_1 = (1:3)/norm(1:3,2);
t1_2 = (4:6)/norm(4:6,2);
t1_3 = (7:9)/norm(7:9,2);
t1_4 = (10:12)/norm(10:12,2);
t1 = zeros(3,2,2);
t1(:,:,1) = [t1_1; t1_2]';
t1(:,:,2) = [t1_3; t1_4]';
[Dp, Dd, Np] = size(t1);
% t2data = {Range[13, 16]/Norm[Range[13, 16], 2], Range[17, 20]/Norm[Range[17, 20], 2], Range[21, 24]/Norm[Range[21, 24], 2], Range[25, 28]/Norm[Range[25, 28], 2]}
t2_1 = (13:16)/norm(13:16, 2);
t2_2 = (17:20)/norm(17:20, 2);
t2_3 = (21:24)/norm(21:24, 2);
t2_4 = (25:28)/norm(25:28, 2);
t2 = [t2_1; t2_2; t2_3; t2_4]';
%%
X1 = repmat(x, 1, 10);
Y1 = repmat(y, 10, 1);
X2 = repmat([1 , 1 , 1, 0, 0, 0]' , 1, 10);
Y2 = ones(10, 1);
X = [X1, X2];
Y = [Y1; Y2];
y_predictions = classify_data_set(X, c,t1,t2,sig);
disp('Should be error = 10, percentage_erro = 0.5');
[error, percentage_error] = classification_error( Y, y_predictions )