%setup
clearvars;
close all;
clc;
model = 'lab3_model_4';

sim(model);
figure;
plot(simout);
%ustawienia wykresu
grid on;
xlabel('t');
ylabel('x(t)');
title(sprintf('wykres...'));