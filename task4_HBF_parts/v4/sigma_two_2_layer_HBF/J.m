function [ j ] = J(x,y, c,t1,t2,sig)
%Computes J(y, f(x)) = ( y - f(x) )^2
%   Computes J(y, f(x)) = ( y - f(x) )^2 for current parameter setting
%   Inputs:
%       x = data point (D x 1)
%           x = [x1, ..., x_np, ..., x_Np]
%       y = label (1 x 1)
%       c = weights (K2 x L)
%       t2 = centers (K1 x K2)
%       t1 = centers (Dp x Dd x Np)
%   Outputs:
%       J(y, f(x)) = (y - f(x))^2
[~, L] = size(c);
ind = ((1:L) == y)'; %(L x 1) 

[ h_x, ~, ~, ~, ~ ] = h( x, c, t1, t2, sig );
% [f_x, f_x_num, f_x_denm, max_exp_h_x] = softmax_layer(h_x);
%exp_h_x = exp(h_x);
largest_h_x = max(h_x);
h_x_p = h_x - largest_h_x;
exp_h_x = exp(h_x_p);
%max_exp_h_x = max(exp_h_x);
z = sum( exp_h_x );
f_x_num = exp_h_x;
f_x_den = z;
f_x = f_x_num / f_x_den;
%if f_x_den ==  Inf || max_exp_h_x == Inf
if f_x_den ==  Inf || z == Inf || isnan(z)
    fileID = fopen(strcat('INFINITY_error' ,'.txt'), 'w');
    fprintf(fileID, 'Ocurred: %12s \n', datestr(clock, 0));
    
    %fprintf(fileID, 'max_exp_h_x: %6.2f \n', max_exp_h_x );
    fprintf(fileID, 'f_x_dem or z: %6.2f \n', f_x_den);
    
    fprintf(fileID, 'exp(h_x): %6.2f \n', exp_h_x );
    fprintf(fileID, 'h_x: %6.2f \n', h_x);
    %fprintf(fileID, 'exp_h_x/max_exp_h_x: %6.2f \n', exp_h_x/max_exp_h_x );
    
    fprintf(fileID, 'f_x_num: %6.2f \n', f_x_num );
    fprintf(fileID, '---- \n');
    fprintf(fileID, 'exp(h_x): %6.2f \n', exp(h_x) );
    fprintf(fileID, '---- \n');
    fprintf(fileID, 'c %6.2f \n', c);
    fclose(fileID); 
    disp('Done making error file!');
    disp('--')
end
log_prob = log(f_x); %log(Prob) = log(exp(hx)) - log(z)

j = ind' * log_prob;
end