function [tout, yout] = rk4(FunFcn, tspan, y0, ssize, eps)



t0=tspan(1);
tfinal=tspan(2);
pm = sign(tfinal - t0);  
if nargin < 4, ssize = (tfinal - t0)/100; end
if ssize < 0, ssize = -ssize; end
h = pm*ssize;
t = t0;
y = y0(:);


dt = abs(tfinal - t0);
N = floor(dt/ssize) + 1;
if (N-1)*ssize < dt
  N = N + 1;
end

tout = zeros(N,1);
tout(1) = t;
yout = zeros(N,size(y,1));
yout(1,:) = y.';
k = 1;

while (k < N)
  if pm*(t + h - tfinal) > 0 
    h = tfinal - t; 
    tout(k+1) = tfinal;
  else
    tout(k+1) = t0 +k*h;
  end
  k = k + 1;

  s1 = feval(FunFcn, t, y, eps); s1 = s1(:);
  s2 = feval(FunFcn, t + h/2, y + h*s1/2, eps); s2=s2(:);
  s3 = feval(FunFcn, t + h/2, y + h*s2/2, eps); s3=s3(:);
  s4 = feval(FunFcn, t + h, y + h*s3, eps); s4=s4(:);
  y = y + h*(s1 + 2*s2 + 2*s3 +s4)/6;
  t = tout(k);
  yout(k,:) = y.';
end;

