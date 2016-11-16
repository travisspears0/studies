%setup
clearvars;
close all;
clc;
model='lab3_model_2';
%przykladowe macierze i wartosc poczatkowa
A = [-2  0;0 -3];
B = [-1;4];
C = eye(2);%[1.5 0.2];
WPC = 1;
n=5;
for i=1:n
    %h zwieksza sie z kazda iteracja
    h=.1+i*.4;
    %wyliczanie macierzy A+,B+,C+ ze wzorow
    x=sym('x');
    AP = exp(A*h);
    BP = double( int(expm(x*A)*B,x,0,h));%calka od 0 do h
    CP=C;
    %symulacja
    sim('lab3_model_2');
    %rysowanie wykresu
    figure;
    plot(simout);
    %ustawienia wykresu
    grid on;
    xlabel('t');
    ylabel('x(t)');
    title(sprintf('uklad ciagly i dyskretny dla h=%d',h));
end

