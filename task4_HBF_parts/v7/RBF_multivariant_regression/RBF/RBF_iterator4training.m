classdef RBF_iterator4training < handle
    %
    
    properties
        c_initilizations
        t_initilizations
        beta
        %% mdl functions
        mdl_func
        param4mdl_func
        train_func
        %% GD
        mu_c
        iterations
        num_initilizations
        %% regularization param
        lambda
        %% iterator index
        current_training_iteration
    end
    
    methods
        function obj = RBF_iterator4training(beta, mdl_func,param4mdl_func,train_func, mu_c,iterations,num_initilizations,lambda)
            obj.beta = beta;
            obj.mdl_func = mdl_func;
            obj.param4mdl_func = param4mdl_func;
            obj.train_func = train_func;
            obj.mu_c = mu_c;
            obj.iterations = iterations;
            obj.num_initilizations = num_initilizations;
            obj.lambda = lambda;
            obj.current_training_iteration = 1;
        end
        function [] = create_initilizations(obj,X,D_out)
            %
            num_inits = obj.num_initilizations;
            [D, N] = size(X);
            c_inits = zeros(N,D_out,num_inits);
            t_inits = zeros(D,N,num_inits);
            for i=1:num_inits
                c_inits(:,:,i) = rand(N,D_out);
                t_inits(:,:,i) = datasample(X', N, 'Replace', false)';
            end
            obj.c_initilizations = c_inits;
            obj.t_initilizations = t_inits;
        end
        function [] = set_inits(obj, c_initilizations,t_initilizations)
            obj.c_initilizations = c_initilizations;
            obj.t_initilizations = t_initilizations;
        end
        function [mdl_trained] = train_iterator(obj,X,y)
            c_init = obj.c_initilizations(:,:,obj.current_training_iteration);
            t_init = obj.t_initilizations(:,:,obj.current_training_iteration);
            rbf_params = obj.param4mdl_func(c_init,t_init,obj.beta,obj.lambda);
            rbd_mdl = obj.mdl_func(rbf_params);
            mdl_trained = rbd_mdl.train(X,y, obj.train_func, obj);
            obj.current_training_iteration = obj.current_training_iteration + 1;   
        end
    end
end

