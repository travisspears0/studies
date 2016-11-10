%setup
clearvars;
close all;
clc;

%parametry
WPC=4;          %warunek poczatkowy
R=10;           %opor
C=.1;           %pojemnosc
K=-1/(R*C);     %stala

n=5;
for i = 1:n
    %zmiana parametrow
    %...
    %przeprowadzenie symulacji i narysowanie wykresu
    sim('model');
    subplot(1,n,i), plot(tout,x);
    hold on;
    %ustawienia wykresu
    grid on;
    xlabel('czas');
    ylabel('napiecie');
    axis([0 10 0 4]);
    title(sprintf('sym obw rc[%d]',i));
end

