function y = liniowa1(t,x) 
y = zeros( size(x));
y(1) = x(2);
y(2) = -2*x(1)-x(2);
end