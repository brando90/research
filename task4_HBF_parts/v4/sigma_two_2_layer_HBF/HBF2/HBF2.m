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
            %constructs HBF2
            obj.c = c;
            obj.t1 = t1;
            obj.t2 = t2;
            obj.beta = beta;
        end
        function y_prediction = predict(obj, x)
            %returns predicted/classification label
            [h_x, ~, ~,~,~ ] = h(x,obj.c,obj.t1,obj.t2,obj.beta);
            y_prediction = find((max(h_x) == h_x));
            y_prediction = y_prediction(1);
        end
        function any_nan_param = any_param_nan(obj)
            %returns true if any parameter is nan
            c_nan = any( any( isnan(obj.c) ) );
            t1_nan = any( any( any( isnan(obj.t1) ) ) );
            t2_nan = any( any( isnan(obj.t2) ) );
            any_nan_param = c_nan || t1_nan || t2_nan;
        end
        function [ f_x, a ] = f(obj,x)
            [ f_x, a ] = f(x,obj.c,obj.t,obj.beta);
        end
        function [ h_x, z_l1, z_l2,a_l2,a_l3 ] = h(obj, x)
            [h_x,z_l1,z_l2,a_l2,a_l3] = h(x,obj.c,obj.t1,obj.t2,obj.beta);
        end
    end
    
end