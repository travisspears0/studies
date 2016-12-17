function [rhs] = f1(t,x,eps,lin)
if lin==0
    rhs = -x + eps*x^2;
elseif lin == 1
    rhs = - x;
else
    rhs= x - 1/eps;
end;    
return;