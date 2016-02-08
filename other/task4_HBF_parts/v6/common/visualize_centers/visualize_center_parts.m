function [ ] = visualize_center_parts( centers )
% Vizualizes the centers
%   input:
%       centers = vectors to plot (D x N)
[~, N] = size(centers);
figure
for n=1:N
    y = centers(:,n);
    %x = linspace(1,D,1);
    x = 1:length(y);
    
    xq = linspace(x(1),length(y),100);
    vq1 = interp1(x,y,xq);
    
    subplot(N,1,n);
    plot(x, y, 'o', xq, vq1, ':.');
end
end