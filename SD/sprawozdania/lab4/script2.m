%setup
clearvars;
close all;
clc;
%
sim('lab4_model_2');
figure;
subplot(1,2,1), plot(x1);
%parametry wykresu
grid on;
xlabel('t');
ylabel('x(t)');
subplot(1,2,2), plot(x2);
%parametry wykresu
grid on;
xlabel('t');
ylabel('x(t)');
%tytul wykresu
title('...');

figure;
hold on;
u1 = tf([1],[1 1 2]);
u2 = tf([1],[1 -.1 1]);
nyquist(u1,'r');
nyquist(u2,'g');
plot(-1, 0); % wykresy beda stabilne bo nie obejmuja punktu (-1,0) -> kryterium Nyquista!

hold off;
%parametry wykresu
grid on;%nie ma siatki, czemu ??
xlabel('t');
ylabel('x(t)');
%tytul wykresu
title('...');

