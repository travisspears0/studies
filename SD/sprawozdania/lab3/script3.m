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
%symulacja

%wartosc h
h=.5;
%wyliczanie macierzy A+,B+,C+ ze wzorow
AP = exp(A*h);
BP = exp(A*h)*B-B;%calka od 0 do h
CP=C;
%symulacja
sim('lab3_model_2');

%rysowanie wykresu
figure(1);
subplot(1,2,1),plot(simout1);
%ustawienia wykresu
grid on;
xlabel('...');
ylabel('...');
title('...');
subplot(1,2,2),plot(simout2);
%ustawienia wykresu
grid on;
xlabel('...');
ylabel('...');
title('...');

