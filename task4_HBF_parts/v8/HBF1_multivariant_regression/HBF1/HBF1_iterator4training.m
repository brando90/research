classdef HBF1_iterator4training < handle
    %
    
    properties
        c_inits
        t_inits
        K
        beta
        %% mdl functions
        mdl_func
        param4mdl_func
        train_func
        %% GD
        iterations
        num_inits
        %% regularization param
        lambda
        %% iterator index
        current_training_iteration
    end
    
    methods
        function obj = HBF1_iterator4training(K, beta, mdl_func,param4mdl_func,train_func,iterations,num_inits,lambda)
            obj.beta = beta;
            obj.K = K;
            obj.mdl_func = mdl_func;
            obj.param4mdl_func = param4mdl_func;
            obj.train_func = train_func;
            obj.iterations = iterations;
            obj.num_inits = num_inits;
            obj.lambda = lambda;
            obj.current_training_iteration = 1;
        end
        function [] = create_initiliazations(obj,X,D_out)
            %
            [D, N] = size(X);
            obj.c_inits = zeros(N,D_out,obj.num_inits);
            obj.t_inits = zeros(D,N,obj.num_inits);
            for i=1:obj.num_inits
                %obj.c_inits(:,:,i) = rand(N,D_out);
                obj.c_inits(:,:,i) = normc( rand(N,D_out) );
                obj.t_inits(:,:,i) = datasample(X', N, 'Replace', false)';
            end
        end
%         function [] = set_initializations(obj, c_inits,t_inits)
%             obj.c_inits = c_inits;
%             obj.t_inits = t_inits;
%         end
        function [mdl_trained] = train_iterator(obj,X,y)
            c_init = obj.c_inits(:,:,obj.current_training_iteration);
            c_init = c_init(1:obj.K,:);
            t_init = obj.t_inits(:,:,obj.current_training_iteration);
            t_init = t_init(:,1:obj.K);
            hbf1_params = obj.param4mdl_func(c_init,t_init,obj.beta,obj.lambda);
            mdl_trained = obj.train(X,y, obj.train_func, hbf1_params);
            obj.current_training_iteration = obj.current_training_iteration + 1;   
        end
        function [trained_mdl] = train(obj,X,y,train_func,mdl_params)
            train_func_name = func2str(train_func);
            if strcmp( train_func_name, 'learn_HBF_SGD') % TODO
                gd_iterations = obj.iterations;
                new_mdl_params = learn_HBF1_SGD(X,y, mdl_params, gd_iterations, 0, 0,0);
            elseif strcmp( train_func_name, 'learn_HBF_batch_GD')
                %fixed centers
                new_mdl_params = learn_HBF1_batch_GD(X, y, mdl_params, obj.iterations, 0, 0,0);
            elseif strcmp( train_func_name, 'learn_HBF_linear_algebra') %TODO
                %fixed centers
                new_mdl_params = learn_RBF_linear_algebra(X,y, mdl_params);
            else
                keyboard
            end
            trained_mdl = obj.mdl_func(new_mdl_params);
        end
    end
end