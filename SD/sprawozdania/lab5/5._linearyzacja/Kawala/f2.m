function [rhs] = f2(t,x,lin)
    if lin == 0
        rhs = [-x(1); -x(2)^2];
    elseif lin == 1
        rhs = [-1,0;0,0]*x;
    end;
end