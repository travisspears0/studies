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


%wartosc h
h=.5;
%wyliczanie macierzy A+,B+,C+ ze wzorow
Ap = exp(A*h);
Bp = exp(A*h)*B-B;%calka od 0 do h
%nowe wartosci macierzy dla symulacji
A=Ap;
B=Bp;
%symulacja
sim('lab3_model');

%rysowanie wykresu
figure(2);
plot(simout);

%tytul wykresu
title('system 1.4 a macierzami A+ B+ C+');

%parametry wykresu
grid on;
xlabel('x');
ylabel('y');
axis([-10 10 -10 10]);


