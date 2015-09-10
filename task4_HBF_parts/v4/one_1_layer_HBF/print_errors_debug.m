function [ ] = print_errors_debug( prev_error, current_error, prec, iteration)
%PRINT_ERRORS_DEBUG prints the current and prev errors for debug
%   Detailed explanation = look at simple code
disp('=== iteration ===');
disp(iteration);
disp('-- prev_error: ');
disp(prev_error);
disp('-- current_error: ');
disp(current_error);
disp('-- abs(current_error - prev_error)');
disp(abs(current_error - prev_error));
disp('-- precision');
disp(prec);
end

