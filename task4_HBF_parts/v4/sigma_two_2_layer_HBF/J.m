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
if any( any( isnan(c) ) ) || any( any( any( isnan(t1) ) ) ) || any( any( isnan(t2) ) )
    disp(any( any( isnan(c) ) ) );
    disp(any( any( any( isnan(t1) ) ) ) );
    disp(any( any( isnan(t2) ) ) );
    keyboard
end

[~, L] = size(c);
ind = ((1:L) == y)'; %(L x 1)

[ h_x, ~, ~, ~, ~ ] = h( x, c, t1, t2, sig );
z = sum( exp(h_x) );
log_prob = h_x - log(z);
j = ind' * log_prob;

if isnan(j)
    f_x = prob_y_x(h_x);
    log_prob = log(f_x);
    j = ind' * log_prob;
    if isnan(j)
        L = length(h_x);
        [ h_x, ~, ~, ~, ~ ] = h( x, c, t1, t2, sig );
        z = sum(h_x)/L + L;
        log_prob = h_x - log(z);
        j = ind' * log_prob;
        if isnan(j)
            keyboard
        end
    end
end

%if any(exp_h_x ==  Inf) || z == Inf || largest == Inf || isnan(j) || any(exp_h_x == 0) || any(f_x == 0)
% if isnan(j)
%     fileID = fopen(strcat('INFINITY_error' ,'.txt'), 'w');
%     fprintf(fileID, 'Ocurred: %12s \n', datestr(clock, 0));
%     
%     fprintf(fileID, 'Reason we halted \n');
%     fprintf(fileID, 'any(exp_h_x ==  Inf) %6.2f \n', any(exp(h_x) ==  Inf) );
%     fprintf(fileID, 'z == Inf %6.2f \n', z == Inf );
%     fprintf(fileID, 'largest == Inf %6.2f \n', max( exp(h_x) ) == Inf);
%     fprintf(fileID, 'isnan( J(x,u;theta) ) %6.2f \n', isnan(j));
%     fprintf(fileID, 'any(exp_h_x == 0) %6.2f \n', any(exp(h_x) == 0) );
%     fprintf(fileID, 'any(f_x == 0) %6.2f \n', any(prob_y_x(h_x) == 0) );
%     
%     fprintf(fileID, '----- \n');
%     
%     %fprintf(fileID, 'largest: %6.2f \n', largest );
%     fprintf(fileID, 'z: %6.2f \n', z);
%     
%     fprintf(fileID, 'h_x: %6.2f \n', h_x);
%     fprintf(fileID, 'exp(h_x): %6.2f \n', exp(h_x) );
%     %fprintf(fileID, 'exp_h_x/max_exp_h_x: %6.2f \n', exp_h_x/max_exp_h_x );
%     
%     fprintf(fileID, 'f_x_num OR exp_h_x: %6.2f \n', exp(h_x) );
%     fprintf(fileID, '---- \n');
%     fprintf(fileID, 'c %6.2f \n', c);
%     fclose(fileID); 
%     keyboard
%     %disp('Done making error file!');
%     %disp('--')
% end
end