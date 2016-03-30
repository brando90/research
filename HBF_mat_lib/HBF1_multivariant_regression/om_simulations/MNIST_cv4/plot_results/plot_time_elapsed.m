%% collect the times in an array
jobs = 10;
centers = zeros(1,jobs);
elapsed_times_minutes = zeros(1,jobs);
elapsed_times_hours = zeros(1,jobs);
for job_num=1:jobs
    prefix_name = sprintf('time_duration_om_id%d.m', job_num);
    times_locations = sprintf('../results/r_25mar_t1/%s', prefix_name);
    run(times_locations);
    centers(job_num) = center;
    elapsed_times_minutes(job_num) = minutes;
    elapsed_times_hours(job_num) = hours;
end
%% plot times
fig = figure
subplot(1,2,1)
plot(centers,elapsed_times_minutes,'-ro')
xlabel('centers');
ylabel('times minutes');
legend('times minutes');
title(sprintf('1st subplot minutes, iterations = %d', iterations))

subplot(1,2,2)
plot(centers,elapsed_times_hours,'-b*')
xlabel('centers');
ylabel('times hours');
legend('times hours');
title(sprintf('2nd subplot hours, iterations = %d', iterations))

saveas(fig, sprintf('elapsed time task_id, center, iterations = %d, %d, %d', task_id, center, iterations));
saveas(fig, sprintf('elapsed time task_id, center, iterations = %d, %d, %d.jpeg', task_id, center, iterations));
beep;