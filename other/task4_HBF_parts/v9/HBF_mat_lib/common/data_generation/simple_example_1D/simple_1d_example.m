%% data set
N = 25;
%D = 1;
%X = rand(D, N);
X = linspace(-5,5,N); %(1 x N)
% y = awgn(X .* X, 1); % (1 X N)
y = (1/3)*sin(3*X).*sin(3*X) + (3/4)*cos(100*X);
% v = (1:D)';
% theta = v/norm(v,2);
% y = awgn(X'*theta, 50)';
