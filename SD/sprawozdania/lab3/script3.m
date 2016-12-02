%setup
clearvars;
close all;
clc;
model='lab3_model_2';
%macierze A, B, C
A = [0 1;-5 -8];
B = [0;1];
C = eye(2);
freq = .1;
%wartosc poczatkowa
WPC = 0;
%ilosc iteracji
n=6;
%poczatkowa wartosc h
h = 0.1;
for i=1:n
    %h zwieksza sie z kazda iteracja
    h=h+i/5;
    %wyliczanie macierzy A+,B+,C+ ze wzorow
    x=sym('x');
    AP = expm(A*h);
    BP = double( int(expm(x*A)*B,x,0,h));%calka od 0 do h
    CP=C;
    %symulacja
    sim(model);
    %rysowanie wykresu
    figure;
    plot(simout);
    %ustawienia wykresu
    grid on;
    xlabel('t');
    ylabel('x(t)');
    title(sprintf('uklad ciagly i dyskretny dla h=%d',h));
end

