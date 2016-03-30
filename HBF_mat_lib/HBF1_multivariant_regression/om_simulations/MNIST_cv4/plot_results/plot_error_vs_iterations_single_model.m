function [fig] = plot_error_vs_iterations_single_model( center, errors_train, errors_test, eta_c, eta_t)
fig = figure
iterations = length(errors_test);
iteration_axis = 0:iterations-1;
plot(iteration_axis,errors_train,'-ro',iteration_axis, errors_test,'-b*');
%plot(iteration_axis(4100:iterations) ,errors_Hfs(4100:iterations) ,'-ro',iteration_axis(4100:iterations) , errors_Test(4100:iterations) ,'-b*');
legend('Training risk','Test risk');
xlabel('SGD iterations') % x-axis label
ylabel('(Squared) Error') % y-axis label
title(sprintf('Train and Test risk over iteration, centers %d-- (eta_c , e_t) = ( %d , %d )', center, eta_c, eta_t) );
end