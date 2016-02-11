% errors_location = '../results/r_10feb_j1/test_error_vs_iterations1';
% load(errors_location);
% errors_train = best_train;
% errors_test = best_test;
% plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)
jobs = 10;
for job_num=1:jobs
    errors_location = sprintf('../results/r_10feb_j3/test_error_vs_iterations%d', job_num);
    load(errors_location);
    errors_train = best_train;
    errors_test = best_test;
    plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)
end