function [ f_x, f_x_num, f_x_den ] = softmax_layer( h_x )
%softmax layer outputs exp(h(x)) and z = sum exp( h(x)_l )
%   Inputs:
%       h_x = output of HBF Net (L x 1)
%   Outputs:
%       f_x = output after softmax (L x 1)
%       f_x_num = z, num of prob (L x 1)
%       f_x_den = den of prob (L x 1)
exp_h_x = exp(h_x);
z = sum(exp_h_x);
f_x_num = exp_h_x;
f_x_den = z;
f_x = f_x_num / f_x_den;
end