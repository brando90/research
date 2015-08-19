%% update t1 unit test
%% Test 0: Random vectors
% % dimensions
% disp('=======> update t1 unit test');
% Dp = 3;
% Np = 4;
% Dd = 2;
% K2 = 5;
% K1 = Dd * Np;
% %% fake data & params
% x = (1:Dp*Np)'/(norm(1:Dp*Np,2)^2);
% %x = (1:Dp*Np)';
% y = 3;
% c = 100*(1:K2)';
% t2 = rand(K1, K2);
% t1 = rand(Dp, Dd, Np);
% % call f(x)
% [f, z_l1, z_l2, a_l2, ~ ] = f_star(x,c,t1,t2);
% % gradient
% df_dt1_loops = compute_df_dt1_loops(t1,x,z_l1,z_l2,a_l2,c,t2);
% eps = 1e-10;
% %eps = 10000;
% for dd=1:Dd
%     for dp=1:Dp
%         for np=1:Np
%             disp('===');
%             e_dd_dp_np = zeros(Dp, Dd, Np);
%             e_dd_dp_np(dp,dd,np) = eps;
%             f_e1 = f_star_loops(x,c,t1+e_dd_dp_np,t2);
%             f_e2 = f_star_loops(x,c,t1-e_dd_dp_np,t2);
%             numerical_derivative = (f_e1 - f_e2)/(2*eps);
%             disp('dd, dp, np')
%             disp([dd, dp, np]);
%             disp('+++++> Numerical Derivative');
%             disp(numerical_derivative);
% %             disp('dJ_dt2_vectorized');
% %             disp(dJ_dt2_vectorized(dd, dp, np);
%             disp('dJ_dt2_loops');
%             disp(df_dt1_loops(dp, dd, np));
%         end
%     end
% end
% % t1_v1 = zeros(Dp, Dd, Np);
% % t1_v2 = 10000 * ones(Dp, Dd, Np);
% % for dd=1:Dd
% %     for np=1:Np
% %         disp('===');
% %         e_dd_dp_np = zeros(Dp, Dd, Np);
% %         e_dd_dp_np(:,dd,np) = eps;
% % % %         f_e1 = f_star_loops(x,c,t1+e_dd_dp_np,t2)
% % % %         f_e2 = f_star_loops(x,c,t1-e_dd_dp_np,t2)
% %         f_e1 = f_star_loops(x,c,t1_v1,t2)
% %         f_e2 = f_star_loops(x,c,t1_v2,t2)
% %         numerical_derivative = (f_e1 - f_e2)/(2*eps);
% %         disp('Numerical Derivative');
% %         disp(numerical_derivative);
% % %       disp('dJ_dt2_vectorized');
% % %       disp(dJ_dt2_vectorized(dd, dp, np);
% %         disp('dd, dp, np')
% %         disp([dd, np]);
% %         disp('dJ_dt2_loops');
% %         disp(df_dt1_loops(:, dd, np));
% %     end
% % end
%% Test 1: 
% dimensions
disp('>>>>>>++++======--------> update t1 unit test');
% fake data & params
x = (1:6)'/norm(1:6,2)
c = [29, 30, 31, 32]'
t2 = [(13:16)/norm((13:16),2); (17:20)/norm((17:20),2); (21:24)/norm((21:24),2); (25:28)/norm((25:28),2)]'
Dp = 3;
Dd = 2;
Np = 2;
t1 = zeros(Dp,Dd, Np); % (Dp, Dd, Np)
t1(:,:,1) = [(1:3)/norm((1:3),2); (4:6)/norm((4:6),2)]';
t1(:,:,2) = [(7:9)/norm((7:9),2); (10:12)/norm((10:12),2)]';
t1
% call f(x)
[f, z_l1, z_l2, a_l2, a_l3 ] = f_star_loops(x,c,t1,t2)
% gradient
df_dt1_loops = compute_df_dt1_loops3(t1,x,z_l1,z_l2,a_l2,c,t2);
df_dt1_loops2 = compute_df_dt1_loops3(t1,x,z_l1,z_l2,a_l2,c,t2);
eps = 1e-10;
dJ_dt1_numerical = compute_numerical_derivatives( x, c, t1, t2, eps);
disp('---- Derivatives ----');
for np=1:Np
    np
    dJ_dt1_numerical_np = dJ_dt1_numerical(:,:,np);
    dJ_dt1_numerical_np
    df_dt1_loops2_np = df_dt1_loops(:,:,np);
    df_dt1_loops2_np
end
% for np=1:Np
%     np
%     for dd=1:Dd
%         dd
%         for dp=1:Dp
%             dp
%             disp('===');
%             e_dd_dp_np = zeros(Dp, Dd, Np);
%             e_dd_dp_np(dp,dd,np) = eps;
%             f_e1 = f_star_loops(x,c,t1+e_dd_dp_np,t2);
%             f_e2 = f_star_loops(x,c,t1-e_dd_dp_np,t2);
%             numerical_derivative = (f_e1 - f_e2)/(2*eps);
%             disp('dp, dd, np')
%             disp([dp, dd, np]);
%             disp('+++++> Numerical Derivative');
%             disp(numerical_derivative);
% %             disp('dJ_dt2_vectorized');
% %             disp(dJ_dt2_vectorized(dd, dp, np);
%             disp('dJ_dt1_loops');
%             disp(df_dt1_loops(dp, dd, np));
%             disp('dJ_dt1_loops2');
%             disp(df_dt1_loops2(dp, dd, np));
%         end
%     end
% end
% t1_v1 = zeros(Dp, Dd, Np);
% t1_v2 = 10000 * ones(Dp, Dd, Np);
% for dd=1:Dd
%     for np=1:Np
%         disp('===');
%         e_dd_dp_np = zeros(Dp, Dd, Np);
%         e_dd_dp_np(:,dd,np) = eps;
% % %         f_e1 = f_star_loops(x,c,t1+e_dd_dp_np,t2)
% % %         f_e2 = f_star_loops(x,c,t1-e_dd_dp_np,t2)
%         f_e1 = f_star_loops(x,c,t1_v1,t2)
%         f_e2 = f_star_loops(x,c,t1_v2,t2)
%         numerical_derivative = (f_e1 - f_e2)/(2*eps);
%         disp('Numerical Derivative');
%         disp(numerical_derivative);
% %       disp('dJ_dt2_vectorized');
% %       disp(dJ_dt2_vectorized(dd, dp, np);
%         disp('dd, dp, np')
%         disp([dd, np]);
%         disp('dJ_dt2_loops');
%         disp(df_dt1_loops(:, dd, np));
%     end
% end