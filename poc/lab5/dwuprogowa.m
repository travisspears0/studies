%clear
clearvars;
close all;
clc;
%vars
bart = imread('archiwum/bart.bmp');

dol = 190;
gora = 215;

bw = bart > dol & bart < gora;
bw = uint8(bw*100);

figure(1);
subplot(1,3,1), imshow(bart);
subplot(1,3,2), imhist(bart);
subplot(1,3,3), imshow(bw);