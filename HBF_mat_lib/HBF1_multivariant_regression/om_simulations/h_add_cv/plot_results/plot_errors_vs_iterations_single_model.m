errors_location = '../results/r_13feb_d1/test_error_vs_iterations1';
load(errors_location);
errors_train = best_train;
errors_test = best_test;
plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)