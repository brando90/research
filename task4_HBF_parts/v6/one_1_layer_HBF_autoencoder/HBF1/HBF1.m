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
            %addpath('model_functions');
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
        end
        function f_x = predict(obj, x)
            %returns predicted/classification label
            [f_x, ~, ~] = obj.f(x);
        end
        function any_nan_param = any_param_nan(obj)
            %returns true if any parameter is nan
            c_nan = any( isnan(obj.c) );
            t_nan = any( any( any( isnan(obj.t) ) ) );
            any_nan_param = c_nan | t_nan;
        end
        function [ f_x, z, a ] = f(obj,x)
            [ f_x, z, a ] = f(x,obj.c,obj.t,obj.beta);
        end
    end
    
end

