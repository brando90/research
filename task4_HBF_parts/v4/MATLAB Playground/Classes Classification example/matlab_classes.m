%% Using classes MATLAB
mdl = HBF1(1,[2,3,4],3);
% mdl.predict_confidence(0.1)
% mdl.predict(0.2)
mdl2 = HBF1(mdl.c, mdl.t, mdl.beta);
mdl2.c = mdl2.c + -1000;
mdl2.t = mdl2.t + -1000;
mdl
mdl2