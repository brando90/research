classdef RBF_parameters4training < handle
    %
    
    properties
        c_initilizations
        t_initilizations
        beta
        %% train_function
        train_func
        %% GD
        mu_c
        iterations
        num_initilizations
        %% regularization param
        lambda
    end
    
    methods
        function obj = RBF_parameters4training(beta,train_func,mu_c,iterations,num_initilizations,lambda)
            obj.beta = beta;
            obj.train_func = train_func;
            obj.mu_c = mu_c;
            obj.iterations = iterations;
            obj.num_initilizations = num_initilizations;
            obj.lambda = lambda;
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
    end
end

