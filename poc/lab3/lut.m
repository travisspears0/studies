clearvars;
close all;
clc;

load ('archiwum/funkcjeLUT');
lena = imread('archiwum/lena.bmp');
%{
imshow(lena);
plot(kwadratowa);

lutted = intlut(lena,odwrotna);
figure(1);
imshow(lutted);
%}
figure(1);
LUT(lena, wykladnicza);