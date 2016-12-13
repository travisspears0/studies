%setup
clearvars;
close all;
clc;
%filtry
dp = tf([1],[4 1]);
gp = tf([.4],[.4 1]);
pp = tf([1],[1 2 1]);
dr = tf([1],[1 .1 1]);

%wykresy charakterystyk bodego
figure;
hold on;
bode(dp,'r');
bode(gp,'g');
bode(pp,'b');
bode(dr,'y');

hold off;
%parametry wykresu
grid on;%nie ma siatki, czemu ??
xlabel('t');
ylabel('x(t)');
%tytul wykresu
title('charakterystki bodego');









