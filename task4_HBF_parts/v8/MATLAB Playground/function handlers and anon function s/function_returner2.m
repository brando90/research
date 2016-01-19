function [ fun_hand ] = function_returner2( x )
%
t = -10000;
function val = h(eta)
    val = -10*x + t + eta^2;
end
fun_hand = @h;
end