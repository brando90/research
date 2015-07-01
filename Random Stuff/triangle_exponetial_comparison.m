%% init
begin = -3.1416;
finish = 3.1416;
delta = 0.01;
%% process x and inputs
x = begin:delta:finish;
%in =  abs(x);
%% Computation
n = 5;
y1 = cos(n * x);
y2 = 2*cos(x) .* cos( (n-1)*x ) - cos((n-2)*x)
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
legend('y1','y2','y3', 'y4')
hold off
