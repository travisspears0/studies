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
rozwiazanie (dla B=0) to:
x(k) = A^k*x(0)
%}

%przykladowe wartosci A:
atab = [-2 -1 -.5 0 .8 1 5];
[x, len] = size(atab);
%przykladowa wartosc poczatkowa
x0 = 2;
%petla wyliczajaca x(k) dla poszczegolnych wartosci A
ks = 1:1:10;%k przyjmuje wartosci od 1 do 10
for i=1:len    %dla kazdego A
    a = atab(i);%biezaca wartosc A
    wyniki = 1:1:10;%tablica wynikow
    for k=ks
        wyniki(k) = a.^k*x0;%kolejne wyniki do tablicy
    end
    figure(i);
    plot(ks,wyniki);
    grid on;
    xlabel('k');
    ylabel('x(k)');
    title(sprintf('wartosci x(k) dla kE[1,10], A=%d, x(0)=%d',a,x0));
end




