function [rhs] = funkcja_3(t,x,type)
    if (type==0)
        rhs = [x(2); -2*x(1)-3*x(1)^2-x(2)];
    elseif (type==1)
        rhs=[0,1;-2,-1]*x;
    else
        rhs=[0,1;2,-1]*(x-[-2/3;0]);
    end;
return;