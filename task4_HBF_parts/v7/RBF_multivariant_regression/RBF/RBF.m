classdef RBF < handle
    %RBF class
    %   class that holds a 1 layered RBF
    
    properties
        c % (K x D)
        t % (D x K)
        beta % (1 x 1)
        mu_c % (1 x 1)
        lambda % (1 x 1)
        iterations % (1 x 1)
    end
    
    methods
        function obj = RBF(c,t,beta)
            %constructs RBF
            %addpath('model_functions');
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
            obj.lambda = 0; %TOD
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
        function [mdl_new] = train(obj, X,y, train_func)
            visualize = 0;
            if strcmp( func2str(train_func), 'learn_RBF_batch_GD')
                mdl_new = learn_RBF_batch_GD(X,y, obj, obj.mu_c, obj.lambda, obj.iterations,visualize, 0,0);
                return
            elseif strcmp( func2str(train_func), 'learn_RBF_linear_algebra')
                %learn_RBF_linear_algebra( X_training_data, mdl, t,beta )
                mdl_new = learn_RBF_linear_algebra(X,y, obj, obj.t, obj.beta);
                return
            else
                keyboard
            end
        end
    end
    
end

