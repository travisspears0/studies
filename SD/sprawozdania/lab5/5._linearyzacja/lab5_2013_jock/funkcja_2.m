function [rhs] = funkcja_2(t,x,type)
    if (type==0)
        rhs = [-x(1); -x(2)^2];
    elseif (type==1)
        rhs = [-1,0;0,0]*x;
    end;
return;