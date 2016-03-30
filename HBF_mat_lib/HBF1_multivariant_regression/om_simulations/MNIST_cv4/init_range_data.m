function [ output_args ] = init_range_data( y_train )
%
%tic
%min_y = min(y_train)
%max_y = max(y_train)
y_std = std(y_train)
y_mean = mean(y_train)
normrnd(y_mean,y_std)
%toc
end