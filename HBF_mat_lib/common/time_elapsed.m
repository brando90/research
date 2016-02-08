function [secs, minutes, hours, iterations] = time_elapsed( iterations,elapsed_time )
%disp('--==>>iterations')
disp(iterations);
%disp('--==--==> TIME');
%disp('elapsed_time, seconds')
secs = elapsed_time;
%disp('elapsed_time, minutes')
minutes = elapsed_time/60;
%disp('elapsed_time, hours')
hours = elapsed_time/(60 * 60);
end

