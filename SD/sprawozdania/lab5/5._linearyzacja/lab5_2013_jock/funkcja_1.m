function [rhs] = funkcja_1(t,x,eps,type)
    if (type==0)
        rhs = -x+eps*x^2;
    elseif (type==1)
        rhs = -x;
    else
        rhs = x-1/eps;
    end;  
return;