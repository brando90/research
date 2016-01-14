x = inf;
t = inf;
eta = inf;
h = function_returner(0);
h(3) %-9991
[x,fval,exitflag] = fminsearch(h,[10]) %returns [0, -10000, 1]