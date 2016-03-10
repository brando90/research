%% errors vs centers
path_to_results = '../results/r_9mar_j2/';
num_models = 15;
fig = plot_results( path_to_results, num_models )
saveas(fig, 'errors_vs_centers');
saveas(fig, 'errors_vs_centers.jpeg');
beep;