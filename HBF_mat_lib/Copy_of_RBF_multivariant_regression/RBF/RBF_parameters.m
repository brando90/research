classdef RBF_parameters < handle
    %
    
    properties
        c
        t
        beta
        lambda
    end
    
    methods
        function obj = RBF_parameters(c,t,beta,lambda)
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
            obj.lambda = lambda;
        end
        function [] = gather(obj)
            obj.c = gather(obj.c);
            obj.t = gather(obj.t);
            obj.beta = gather(obj.beta);
            obj.lambda = gather(obj.lambda);
        end
    end
    
end

