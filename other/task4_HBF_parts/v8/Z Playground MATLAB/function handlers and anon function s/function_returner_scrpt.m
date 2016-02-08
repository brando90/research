x = inf;
t = inf;
eta = inf;
h = function_returner(0);
h(3) %-9991
[x,fval,exitflag] = fminsearch(h,[10]) %returns [0, -10000, 1]
%%
disp('----');
x = inf;
t = inf;
eta = inf;
h2 = function_returner2(0);
h2(3) %-9991
[x,fval,exitflag] = fminsearch(h2,[10]) %returns [0, -10000, 1]