classdef RBF < handle
    %RBF class
    %   class that holds a 1 layered RBF
    
    properties
        c % (K x D_out)
        t % (D x K)
        beta % (1 x 1)
        lambda % (1 x 1)
    end
    
    methods
        function obj = RBF(rbf_params)
            %constructs RBF
            obj.c = rbf_params.c;
            obj.t = rbf_params.t;
            obj.beta = rbf_params.beta;
            obj.lambda = rbf_params.lambda; %TODO
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
        function [f] = predict_data_set(obj,X)
            Kern = produce_kernel_matrix( X, obj.t, obj.beta ); % (N x K)
            f = Kern * obj.c; % (N x D)
            f = f';
        end
        function [mdl_params] = gather(obj)
            mdl_params = RBF_parameters(-1,-1,-1,-1);
            mdl_params.c = gather(obj.c);
            mdl_params.t = gather(obj.t);
            mdl_params.beta = gather(obj.beta);
            mdl_params.lambda = gather(obj.lambda);
        end
    end
end