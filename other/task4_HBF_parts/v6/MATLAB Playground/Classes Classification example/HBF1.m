classdef HBF1
    %HBF2 class
    %    class that holds a 2 latered HBF
    
    properties
        c % (K x L)
        t % (D x K)
        sig % (1 x 1)
    end
    
    methods
        function obj = HBF1(c,t,sig)
            obj.c = c;
            obj.t = t;
            obj.sig = sig;
        end
        function [y_label, y_confidence] = predict_confidence(obj, x)
            y_label = obj.c + x;
            y_confidence = obj.sig + x;
        end
        function y = predict(obj, x)
            y = obj.sig + x;
        end
    end
    
end