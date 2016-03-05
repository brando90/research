%% errors vs centers
path_to_results = '../results/r_4mar_j1/';
num_models = 20;
fig = plot_results( path_to_results, num_models )
saveas(fig, 'errors_vs_centers');
saveas(fig, 'errors_vs_centers.jpeg');
beep;