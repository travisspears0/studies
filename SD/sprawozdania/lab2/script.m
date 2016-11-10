%setup
clearvars;
close all;
clc;
%macierze jordana dla poszczegolnych portretow fazowych
macierze = [
    [0 0;0 0];
    [0 1;0 0];
    [-1 0;0 0];
    [-1 0;0 -2];
    [-1 0;0 -1];
    [-1 1;0 -1];
    [-1 0;0 1];
    [0 1;-1 0];
    [-1 1;-1 -1];
];
%
len=length(macierze)/2;
i=1;
while i<length(macierze)
    disp(sprintf('(%d)',round(i/2)));
    disp(sprintf('|%d %d|',macierze(i,1),macierze(i,2)));
    disp(sprintf('|%d %d|',macierze(i+1,1),macierze(i+1,2)));
    i=i+2;
end
i=-1;
while i<1 || i>len
    i = input('Wybierz macierz');
end
i=i*2-1;
J = [macierze(i,1) macierze(i,2);macierze(i+1,1) macierze(i+1,2)];
P = eye(2);
A = P*J*P^(-1);

%{
%ustawienia wykresu
figure(1);2

hold on;
grid on;
xlabel('x');
ylabel('y');
axis([0 10 0 10]);
title('portret fazowy');
%}

