disp('Running...');
%% init
begin = -3.1416;
finish = 3.1416;
delta = 0.01;
%% process x and inputs
x = begin:delta:finish;
x =  abs(x) .* abs(x); %% x^2
%% Computation
n = 5;
y1 = rbf( begin:delta:finish);
y2 = triangle(x);
% y1 = rectifier_offset(0, x);
% y2 = (1/2) * (x + abs(x));
%y1 = triangle(x);
%y1 = cos(x);
%y2 = rbf(x);
% y1 = cos(n * x);
% z_1 = cos(x) + sqrt(cos(x).^2 - 1);
% z_2 = cos(x) - sqrt(cos(x).^2 - 1);
% y2 = (1/2) * ( z_1.^n + z_2.^n  );
%y1 = rbf(x);
%y1 = cos(5 * x);
%y2 = max(0, sqrt(1 - cos(x)) - (1/sqrt(2)));
%y3 = y1 .* y2;
%y4 = 1 - cos(x);
%y2 = rectifier(x-1) - rectifier(x) + 1;
%y2 = triangle(x - 0.2);
%% Plots
clf
plot(x, y1)
hold on
plot(x, y2)
%plot(x, y3)
%plot(x, y4)
legend('y1','y2')
hold off
