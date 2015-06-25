x = [0:0.01:2];

% y1 = exp( -1 * abs(x - 1) .* abs(x - 1) )
in =  abs(x - 1);
y1 = rbf(in);
y2 = triangle(in);
plot(x, y1)
hold on
plot(x, y2)