%% df_dt unit test
x = (1:3)'/norm(1:3, 2)
c = [17:20]'
t = [(4:6)/norm((4:6),2); (7:9)/norm((7:9),2); (10:12)/norm((10:12),2); (13:15)/norm((13:15),2)]'
lambda = 0;
df_dt = compute_df_dt( x, c, t, lambda );
eps = 1e-10;
df_dt_numerical = compute_df_dt_numerical_derivatives(x, c, t, eps);
%% print derivatives
df_dt
df_dt_numerical