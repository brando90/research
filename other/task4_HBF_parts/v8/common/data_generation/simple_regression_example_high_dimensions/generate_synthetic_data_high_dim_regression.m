%% data set 1
snr = 8;
N = 3000;
D = 300
D_out = 100
[X, y] = generate_high_dim_regression( N, D, D_out, snr);
%% data set split
per_train = 0.6;
per_cv = 0.3;
data4cv = cross_validation_data(X,y,per_train,per_cv);
%% save file
name_file = strcat('../../data/data_synthetic_data1_N' ,num2str(N),'_D',num2str(D),'_Dout',num2str(D_out),'snr',num2str(snr),'.mat');
save( name_file,'data4cv');