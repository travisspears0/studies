%setup
clearvars;
close all;
clc;
%prosty UI
A = eye(2);
disp('podaj macierz');
for i=1:2
    for j=1:2
        A(i,j) = input(sprintf('A(%d,%d) ',i,j));
    end
end

P = eye(2);%macierz jednostkowa
J = P^(-1)*A*P;%macierz ze wzrou na macierz Jordana

%ustawienia wykresu
figure;%wykres
hold on;%blokada-rysowanie w petli na jednym wykresie

n=10;%zakres petli
s=.5;%skok
for i=-n:s:n%petla od -n do n, skok o s
    WPC=[sin(i) ; cos(i)];%zmieniane z kazdym obiegiem petli wartosci poczatkowe
    if(J(1,2)==-J(2,1) && J(1,1)==0 && J(2,2)==0)%dla okregow
        WPC=WPC*i;  %mnozymy wartosci poczatkowe przez zmienna iteracyjna,
                    %by okregi na wykresie nie nachodzily na siebie
    end;
    sim('lab2_model');%symulacja
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


