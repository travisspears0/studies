%setup
clearvars;
close all;
clc;

%parametry
WPC=6;          %warunek poczatkowy
R=10;           %opor
C=.1;           %pojemnosc
K=-1/(R*C);     %stala

n=5;
for i = 1:n
    %zmiana parametrow
    R=30/i;
    K=-1/(R*C);
    %przeprowadzenie symulacji i narysowanie wykresu
    sim('model');
    subplot(1,n,i), plot(tout,x);
    %ustawienia wykresu
    hold on;
    grid on;
    xlabel('czas');
    ylabel('napiecie');
    axis([0 10 0 WPC]);
    title(sprintf('sym obw rc[%d]',i));
end

