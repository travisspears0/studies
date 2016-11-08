%clear
clearvars;
close all;
clc;
%vars
lena = imread('archiwum/lena1.bmp');
lenad = imadjust(lena);

figure(1);
subplot(1,2,1), imshow(lena);
subplot(1,2,2), imshow(lenad);

