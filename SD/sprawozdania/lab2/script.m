%setup
clearvars;
close all;
clc;
%macierze jordana dla poszczegolnych portretow fazowych
macierze = [
    [0 0;0 -1];
    [0 1;0 0];
    [-1 0;0 0];
    [-1 0;0 -2];
    [-1 0;0 -1];
    [-1 1;0 -1];
    [-1 0;0 1];
    [0 1;-1 0];
    [-1 1;-1 -1];
];

%prosty UI
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
%odczytanie wybranej macierzy jordana
i=i*2-1;
J = [macierze(i,1) macierze(i,2);macierze(i+1,1) macierze(i+1,2)];

P = eye(2);%macierz jednostkowa
A = P*J*P^(-1);%macierz ze wzrou na macierz Jordana

%ustawienia wykresu
figure(1);%wykres
hold on;%blokada-rysowanie w petli na jednym wykresie

n=10;%zakres petli
s=.5;%skok
for i=-n:s:n%petla od -n do n, skok o s
    WPC=[sin(i) ; cos(i)];%zmieniane z kazdym obiegiem petli wartosci poczatkowe
    if(J(1,2)~=0 && J(2,1)~=0)%dla lambd zespolonych
        WPC=WPC*i;  %mnozymy wartosci poczatkowe przez zmienna iteracyjna,
                    %by okregi na wykresie nie nachodzily na siebie
    end;
    sim('model');%symulacja
    plot(simout(:,1),simout(:,2));%rysowanie wykresu
end
hold off;%zwolnienie blokady

%parametry wykresu
grid on;
xlabel('x1');
ylabel('x2');
p=6;%podzielnik dla zakresu wykresu
axis([-n/p n/p -n/p n/p]);
title('portret fazowy');


