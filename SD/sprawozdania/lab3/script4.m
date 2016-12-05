%setup
clearvars;
close all;
clc;

%punkt poczatkowy
x0=-1;
%dokladnosc
e=.1;
%krance przedzialu 
a = -2.5;
b = -.5;
%maksymalna ilosc iteracji
maxiter = 20;
i=0;
oldx = x0;
oldf = fcn(x0);
while(i<maxiter)
    %f(xn)
    f = fcn(oldx);
    %f'(xn)
    fp = diff(f);
    %x(n+1)
    x= oldx-(f/fp);
    display(sprintf('iteracja %d, x: %d',i,x));
    %wrunki wyjscia z petli
    if(abs(fcn(x)) <= e)
        display('war1');
        break;
    end;
    if(abs(oldf-fcn(x))<=e)
        display('war2');
        break;
    end;
    i=i+1;
    oldx = x;
    oldf = f;
end

display(sprintf('wynik: %d',x));
display(sprintf('funkcja od wyliczonego x: %d',cos(x)));

display(sprintf('iteracji: %d',i));


