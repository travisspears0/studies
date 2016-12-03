%setup
clearvars;
close all;
clc;
model='lab3_model_3';

%kapital poczatkowy
K0 = 1000;
%stopa procentowa
r = 10;
%czas trwania inwestycji
n = 24;

%tabela z ilosciami kapitalizacji w roku
marr = [0 1 2 3 4 6 12];
[x,len] = size(marr);
resarr = zeros(len);
for i=1:len
    %liczba kapitalizacji w roku
    m = marr(i);
    %symulacja
    sim(model);
    resarr(i) = simout(1,2);
end

figure;
plot(marr,resarr);
grid on;
xlabel('ilosc kapitalizacj');
ylabel('kapital koncowy');
    
    