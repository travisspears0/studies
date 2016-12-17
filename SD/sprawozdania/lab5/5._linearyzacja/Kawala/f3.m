function [rhs] = f3(t,x,lin)
    if lin==0
        rhs = [x(2); -2*x(1)-3*x(1)^2-x(2)];
    elseif lin==1
        rhs=[0,1;-2,-1]*x;
    else
        rhs=[0,1;2,-1]*(x-[-2/3;0]);
end