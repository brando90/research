classdef HBF2
    %HBF2 class
    %    class that holds a 1 latered HBF
    
    properties
        c % (K2 x L)
        t1 % (Dp x Dd x Np)
        t2 % (K2 x K1)
        beta % (1 x 1)
    end
    
    methods
        function obj = HBF2(c,t1,t2,beta)
            obj.c = c;
            obj.t1 = t1;
            obj.t2 = t2;
            obj.beta = beta;
        end
        function y_prediction = predict(obj, x)
            [h_x, ~, ~,~,~ ] = h(x,obj.c,obj.t1,obj.t2,obj.beta);
            y_prediction = find((max(h_x) == h_x));
            y_prediction = y_prediction(1);
        end
    end
    
end