%setup
clearvars;
close all;
clc;

%{
rownanie liniowe z sekcji 1.3.1
x(k+1) = Ax(k)+Bu(k)
dla B=0
x(k+1) = Ax(k)
przypadki
    A < -1
    A = -1
    A > -1 i A < 0
    A = 0
    A > 0 i A < 1
    A = 1
    A > 1
%}
%{
%przykladowe wartosci w tablicy:
atab = [-2 -1 -.5 0 .8 1 5];
[x, len] = size(atab);
%przykladowa wartosc poczatkowa
x0 = 1;

%petla dla kolejnych wartosci A
for i=1:len
    a = atab(i);
end
%}
%fun = @(x) x.^2;
%q = integral(fun,2,5)

A = [ -2  0 ;
       0 -3 ];
B = [ -1 ;
       4 ];
C = [ 1.5 0.2 ];

h=3;

Ap = exp(A*h);
syms x;
Bp = int(exp(A*x)*B, 0, h);
Cp = C;

