classdef HBF1_parameters < handle
    %
    
    properties
        c
        t
        beta
        lambda
    end
    
    methods
        function obj = HBF1_parameters(c,t,beta,lambda)
            obj.c = c;
            obj.t = t;
            obj.beta = beta;
            obj.lambda = lambda;
        end
    end
    
end

