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
            %constructs HBF1
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
        end
        function y_prediction = predict(obj, x)
            %returns predicted/classification label
            [h_x] = h(x,obj.c,obj.t,obj.beta);
            y_prediction = find((max(h_x) == h_x));
            y_prediction = y_prediction(1);
        end
        function any_nan_param = any_param_nan(obj)
            %returns true if any parameter is nan
            c_nan = any( isnan(obj.c) );
            t_nan = any( any( any( isnan(obj.t) ) ) );
            any_nan_param = c_nan | t_nan;
        end
        function [ f_x, a ] = f(obj,x)
            [ f_x, a ] = f(x,obj.c,obj.t,obj.beta);
        end
        function [ h_x, z, a ] = h( obj, x)
            [ h_x, z, a ] = h( x,obj.c,obj.t,obj.beta );
        end
    end
    
end

