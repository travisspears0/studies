%clear
clearvars;
close all;
clc;
%vars
l1 = imread('archiwum/lena1.bmp');
l2 = imread('archiwum/lena2.bmp');
l3 = imread('archiwum/lena3.bmp');
l4 = imread('archiwum/lena4.bmp');

figure(1);
subplot(2,4,1), imshow(l1);
subplot(2,4,2), imshow(l2);
subplot(2,4,3), imshow(l3);
subplot(2,4,4), imshow(l4);

subplot(2,4,5), imhist(l1);
subplot(2,4,6), imhist(l2);
subplot(2,4,7), imhist(l3);
subplot(2,4,8), imhist(l4);

hist = imread('archiwum/hist1.bmp');

figure(2);
subplot(1,2,1), imshow(hist);
subplot(1,2,2), imhist(hist);
