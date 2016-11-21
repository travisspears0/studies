%setup
clearvars;
close all;
clc;
%
figure;
n=3;
for i=1:n
    s=i;
    sim('lab4_model');
    subplot(1,n,i), plot(simout);
    %tytul wykresu
    title(sprintf('s=%d',s));
    %parametry wykresu
    grid on;
    xlabel('t');
    ylabel('x(t)');
end