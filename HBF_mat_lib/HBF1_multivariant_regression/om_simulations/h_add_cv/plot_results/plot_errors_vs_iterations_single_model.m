errors_location = '../results/r_13feb_j2/test_error_vs_iterations2';
load(errors_location);
errors_train = best_train;
errors_test = best_test;
plot_error_vs_iterations_single_model( center, iterations, errors_train, errors_test, eta_c, eta_t)