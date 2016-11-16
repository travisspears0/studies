%setup
clearvars;
close all;
clc;

%przykladowe macierze i wartosc poczatkowa
A = [-2  0;0 -3];
B = [-1;4];
C = eye(2);%[1.5 0.2];
D = [0;0];
WPC = 1;
%symulacja

sim('lab3_model');
%rysowanie wykresu
figure(1);
plot(simout);
%tytul wykresu
title('system 1.4 a macierzami A B C');

%parametry wykresu
grid on;
xlabel('t');
ylabel('x(t)');

n=5;
for i=1:n
    %wartosc h
    h=.3+.1*i;
    %wyliczanie macierzy A+,B+,C+ ze wzorow
    AP = exp(A*h);
    x=sym('x');
    BP = double( int(expm(x*A)*B,x,0,h));%calka od 0 do h
    %nowe wartosci macierzy dla symulacji
    A=AP;
    B=BP;
    %symulacja
    sim('lab3_model');

    %rysowanie wykresu
    figure;
    plot(simout);

    %tytul wykresu
    title(sprintf('system 1.4 a macierzami A+ B+ C+ dla h=%d',h));

    %parametry wykresu
    grid on;
    xlabel('t');
    ylabel('x(t)');
end

