classdef HBF1
    %HBF1 class
    %   class that holds a 1 layered HBF
    
    properties
        c % (K x L)
        t % (D x K)
        beta % (1 x 1)
    end
    
    methods
        function obj = HBF1(c,t,beta)
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
        end
        function y_prediction = predict(obj, x)
            [h_x] = h(x,obj.c,obj.t,obj.beta);
            y_prediction = find((max(h_x) == h_x));
            y_prediction = y_prediction(1);
        end
    end
    
end

