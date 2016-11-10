%clear
clearvars;
close all;
clc;
%
load('archiwum/histogramZadany');

ph = imread('archiwum/phobos.bmp');

figure(1);
subplot(1,5,1), imshow(ph);
subplot(1,5,2), histeq(ph);
subplot(1,5,3), histeq(ph, histogramZadany);
subplot(1,5,4), imshow(imadjust(ph));
subplot(1,5,5), imshow(adapthisteq(ph));