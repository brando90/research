% errors_location = '../results/r_15feb_j4/test_error_vs_iterations20';
% load(errors_location);
% errors_train = best_train;
% errors_test = best_test;
% plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)
%%
jobs = 20;
for job_num=1:jobs
    prefix_name = sprintf('test_error_vs_iterations%d',job_num);
    errors_location = sprintf('../results/r_26feb_GPU1_t1/%s', prefix_name);
    load(errors_location);
    errors_train = best_train;
    errors_test = best_test;
    fig = plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)
    %saveas(fig, sprintf( '%s.jpeg',prefix_name) );
    saveas(fig, sprintf('%d',center));
end