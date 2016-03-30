clear;
%% errors vs iterations
location = 'errors_vs_iterations';
mkdir( sprintf('../%s',location) )
jobs = 10;
for job_num=1:jobs
    prefix_name = sprintf('test_error_vs_iterations%d',job_num);
    errors_location = sprintf('../results/r_25mar_t1/%s', prefix_name);
    load(errors_location);
    errors_train = best_train;
    errors_test = best_test;
    fig = plot_error_vs_iterations_single_model( center, errors_train, errors_test, eta_c, eta_t)
    %saveas(fig, sprintf( '../%s/%d.jpeg',location, center) );
    %saveas(fig, sprintf('../%s/%d',location, center) );
end
beep;