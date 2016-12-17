function y = liniowa2(t,x) 
y = zeros( size(x));
y = [0,1;2,-1]*(x' - [-2/3;0]);
y = y';
end